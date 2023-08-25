rulescalculations:async(useridentifier,activity_id)=>{
    let changeintotalpercentageforage = 0;
    let changeintotalpercentageforfitnesslevel = 0;
    // 1st rule
    const user = await db.users.findOne({
        where: {
            id: parseInt(useridentifier)
        }
    })
    
    const dob = user?.dateofbirth;
   
    const usersAge = getAgeFromDobForUser(dob)
    
    if (usersAge && usersAge>=18) {
        const changeintotal = await db.rulesforage.findOne({
            where: {
                minage: {
                    [Op.lte]: usersAge
                },
                maxage: {
                    [Op.gte]: usersAge
                }
            }

        })
        changeintotalpercentageforage = changeintotal.changepercentage
    }




    // 2nd rule
    let userLevel = undefined;
    if (user) {
        // 2nd rule for fitnesslevel
        // Fetch the fitness level for the given user with the latest date
        const fitnesslevel = await db.trainingzones.findOne({
            where: {
                user_id: parseInt(user.id),
                activity_id: activity_id
            },
            order: [['date', 'DESC']], // Order by date in descending order to get the latest date first
            limit: 1 // Limit the result to 1 to get only the latest record
        });

        // If fitness level exists, fetch the corresponding rules for fitness level
        if (fitnesslevel?.fitnesslevel_id) {
            
            changeInTotalForFitnessLevel = await db.rulesforfitnesslevel.findOne({
                where: {
                    level_id: fitnesslevel.fitnesslevel_id
                },
                include: [db.levels]
            });
            // console.log("changeInTotalForFitnessLevel?.fitnesslevel_id",changeInTotalForFitnessLevel)
           userLevel=changeInTotalForFitnessLevel?.level?.level;
            const changePercentage = changeInTotalForFitnessLevel?.changepercentage;
            if (changePercentage) {
                changeintotalpercentageforfitnesslevel = changePercentage;
            }
        }





    }
    return {changeintotalpercentageforage,changeintotalpercentageforfitnesslevel}
}

handleweekcalulation:async(startdate,combosArray,randomStr)=>{
    let currentweek = 1;
    let dataforweek= 1;
    let currentdate = undefined;
    
    let newstartday = getNextCycleDate(startdate, combosArray);
    // console.log("randomStr", randomStr)
    if (randomStr != undefined && randomStr != null && randomStr != "") {
        prevWeek = await db.workout_schedule.max('week', {
            where: {
                identifier: randomStr
            }
        });
        // console.log("prevWeek",prevWeek)
        prevDate = await db.workout_schedule.max('date', {
            where: {
                identifier: randomStr,
                week: prevWeek
            }
        })
        // console.log("prevDate",prevDate)
        let lastweekgoal = await db.workout_schedule.findOne({
            where: {
                identifier: randomStr,
                week: prevWeek,
                date:prevDate
            }
        })
        // console.log("lastweekgoal",lastweekgoal.goal)
        currentdate = new Date(prevDate)
        currentweek = parseInt(prevWeek) + 1
        oldgoal = lastweekgoal?.goal
        // console.log("prevWeek",prevWeek)
        // console.log("oldgoal",oldgoal)
        // console.log("goal",goal)
        if (oldgoal&&oldgoal === goal) {

            newstartday = currentdate ? getNextCycleDate(currentdate, combosArray) : getNextCycleDate(startdate, combosArray);
            currentweek = currentweek
            dataforweek = currentweek
        } else {
            newstartday = currentdate ? getNextCycleDate(currentdate, combosArray) : getNextCycleDate(startdate, combosArray);
            currentweek = currentweek
            dataforweek = 1
            
        }

    }
    return {currentweek,dataforweek,newstartday}
},

generatereportv5: async (req, res) => {
    const { startdate, daysoptions, comboselem, phaseno, goal, uid, useridentifier,activity_id } = req.body;
    const {changeintotalpercentageforage,changeintotalpercentageforfitnesslevel}=await rulescalculations(useridentifier,activity_id)

    let randomStr = uid;
    const dayscombo = await db.days_options.sync().then(() => {
        return db.days_options.findOne({ where: { run_days_per_week: parseInt(daysoptions), options: parseInt(comboselem) ,activities:activity_id} })
    })
    // console.log("days",dayscombo)
    const daysoptionsmapping = {
        2: "twodays",
        3: "threedays",
        4: "fourdays",
        5: "fivedays",
        6: "sixdays",
        7: "sevendays",
        1: "oneday"
    }
    const exercisecolumnmapping={
        1:"first",
        2:"second",
        3:"third",
        4:"fourth",
        5:"fifth",
        6:"sixth",
        7:"seventh"
    }
    const workouts = await db.days_options.sync().then(async () => {
        return db.days_options.findOne({
            where: {
                run_days_per_week: parseInt(daysoptions),
                options: parseInt(comboselem),
                activities:activity_id+''

            }
        })
    })
    const workoutnamemapping = [
        { index: 1, value: workouts.sunday, day: "Sunday" },
        { index: 2, value: workouts.monday, day: "Monday" },
        { index: 3, value: workouts.tuesday, day: "Tuesday" },
        { index: 4, value: workouts.wednesday, day: "Wednesday" },
        { index: 5, value: workouts.thursday, day: "Thursday" },
        { index: 6, value: workouts.friday, day: "Friday" },
        { index: 7, value: workouts.saturday, day: "Saturday" },
    ]
   

    const combosArray = dayscombo.dayscode.split("").map(e => parseInt(e));
    
    const unitofexersice = "KM"
    const totalweeks = 1;
    const totaldays = totalweeks * 7;

    const maptotextualday = {
        0: "Sunday",
        1: "Monday",
        2: "Tuesday",
        3: "Wednesday",
        4: "Thursday",
        5: "Friday",
        6: "Saturday"
    };


    const alldates = [];
    let week = [];

// if already working out for a while means have a entry for prior weeks
    let {currentweek,dataforweek,newstartday}=await handleweekcalulation(startdate,combosArray,randomStr)    

// console.log("dataforweek",dataforweek)




    //subactivity

    const subactivity = await db.phasesubactivity.sync().then(() => {
        return db.phasesubactivity.findAll(
            {   where:{
                activities:activity_id+''
            },
                include: [db.subworkout, db.workout, db.phasename]
            }
        )
    })

    //check multiple occurances of same phaseno



    // get distinct phase ids
    const allphaseids = subactivity.map(e => e.phase_id)

    const distinctphaseids = [...new Set(allphaseids)]

    // get all occurances of phase ids
    const numberofoccrances = distinctphaseids.map(e => {
        const occur = allphaseids.map((e1, index) => {
            if (e1 == e) {
                return subactivity[index]
            }
            return null
        })
        const removenull = occur.filter(e => e != null)



        return { e, occured: removenull.length, index: removenull }
    })
    // return res.json(numberofoccrances)






    // subactivity
    let numberofoccurenceMutable = numberofoccrances.slice();

    // console.log("before numberofoccurenceMutable",numberofoccurenceMutable)
    for (let i = 0; i < totaldays; i++) {
        let weeknumber = dataforweek // Use Math.floor for better readability


        let date = new Date(newstartday);
        date.setDate(date.getDate() + i);
        let newdate = date.toISOString().split("T")[0];
        let newday = date.getDay();



        
        if (combosArray.includes(newday)) {
            week.push({
                newdate,
                newday: maptotextualday[newday],
                newweek: parseInt(currentweek)
            });
        }
        if ((i + 1) % 7 === 0) {
            const phasenofortheweek = await db.phase.findOne({ where: { phaseno: parseInt(phaseno), week: weeknumber,activities:activity_id+'' } })
            // console.log("phasenofortheweek",phasenofortheweek)
            let weekdata = await db.goals.findOne({ where: { week: weeknumber, goal: goal } })
           
            let totalquota = weekdata[daysoptionsmapping[daysoptions]]
           
            //1 st rule base on age
            totalquota = totalquota + (totalquota * (changeintotalpercentageforage / 100)) + ((totalquota * (changeintotalpercentageforfitnesslevel / 100)))
            
            let newweek = []
            let workoutnamespliceable = workoutnamemapping.slice();
           
            for (index = 0; index < week.length; index++) {
                const day = week[index]

               

                let occurance = numberofoccurenceMutable.find(e => e.e == phasenofortheweek.phase)
                // return res.json(occurance)
                // let desiganatedworkoutfortheday = workoutnamespliceable.find(d => d.day == day.newday)["value"]
                // return res.json(weekdata)
                let subactivityfortheday;
                let indexofacitivity = 0
                // console.log("indexofacitivity",indexofacitivity)
                subactivityfortheday = occurance.index[indexofacitivity]
                if (indexofacitivity == -1 || indexofacitivity == undefined) {
                    return res.json({combosArray,desiganatedworkoutfortheday, indexofacitivity, occurance, day, weeknumber, phase: phasenofortheweek.phase, indexofday: index })
                }

                // let subactivityfortheday=sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,workoutnamespliceable[0]["index"])
                // console.log("weekdata[exercisecolumnmapping[index+1]",weekdata[exercisecolumnmapping[index+1]])
                // console.log("weekdata",weekdata)
                // console.log("weekdata[workoutmapping2[desiganatedworkoutfortheday]",weekdata[workoutmapping2[desiganatedworkoutfortheday]])
                day.quota = (totalquota * (weekdata[exercisecolumnmapping[index+1]] / 100)).toFixed(2) + ' ' + unitofexersice
                day.quotawithoutunit = (totalquota * (weekdata[exercisecolumnmapping[index+1]] / 100)).toFixed(2)
                //  console.log("index of loop i,index",i,index)
                day.phase = subactivityfortheday.phasename.phase;
                day.phaseid = subactivityfortheday.phase_id
                day.goal = goal


                // just to show
                // day.user_age = usersAge
                // day.agechage = changeintotalpercentageforage
                // day.users_fitnesslevel = userLevel?userLevel : "not set"
                // day.levelchage = changeintotalpercentageforfitnesslevel
                //just ot show

                day.totalquota = totalquota.toFixed(2) + ' ' + unitofexersice
                
                
               
                day.sub_workout_id = subactivityfortheday.subworkout.id
                // console.log("day.newday",day.newday)
                day.workoutname =workoutnamemapping.find(e=>e.day==day.newday).value
                day.subworkout = subactivityfortheday.subworkout.subworkout


                newweek.push(day)

                sliceOccurences(numberofoccurenceMutable, phasenofortheweek.phase,weeknumber, 0)
                // workoutnamespliceable.splice(0,1)

                // return res.json(numberofoccurenceMutable)
            }

            alldates.push({ week: currentweek, weekdates: [...week], totalquota });
            week = [];
        }

    }
    const datatosend=await savedatatodb(randomStr,alldates)
    return res.json({ alldates:datatosend, randomstring });
},

savedatatodb: async (randomStr,alldates) => {
    let randomstring = randomStr ? randomStr : generateRandomString(12)
  
        const datatosend=[]
        for (let k = 0; k < alldates.length; k++) {
            let newweek = alldates[k].weekdates
            // console.log("newweek",newweek)
            let weektopush=[]
            for (let l = 0; l < newweek.length; l++) {
                let newday = newweek[l]
                const day=await db.workout_schedule.create({
                    numofrunningdays: parseInt(daysoptions),
                    daysoption: parseInt(comboselem),
                    week: alldates[k].week,
                    identifier: randomstring,
                    process:"A",
                    date: newday.newdate,
                    day: newday.newday,
                    total_quota_for_week: newday.totalquota,
                    day_quota: newday.quotawithoutunit,
                    unit:unitofexersice,
                    phase_id: newday.phaseid,
                    phase_name: newday.phase,
                    workout: newday.workoutname,
                  
                    sub_workout: newday.subworkout,
                    sub_workout_id: newday.sub_workout_id,
                    goal: goal
                });
                weektopush.push(day)

            }
            datatosend.push({week:alldates[k].week,weekdates:weektopush,totalquota:alldates[k].totalquota})

        }
        return datatosend
}