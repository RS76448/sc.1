const base_url = "http://localhost:3000";
const daysoptions = require("../models/daysoptions")
const runningquotas = require("../models/runningquotas")
const db = require("../config/db")
const { Op } = require('sequelize');
const {convertToSQLTimeFormat}=require("../utils/timeutils")
const {getminandmaxtimerange}=require("../utils/timeutils")
const { getNextCycleDate } = require("../utils/dateutils")
const {sliceOccurences}=require("../utils/datautils")
module.exports = {
    addSchedule: async (req, res) => {
        return res.render("addSchedule.ejs", {
            base_url
        })
    },
    renderFn: async (req, res) => {
       
        return res.render("fn.ejs", {
            base_url
        })
    },
    renderFn1: async (req, res) => {
        
        return res.render("fn1.ejs", {
            base_url
        })
    },
    getzones: async (req, res) => {
        const activities = await db.activities.sync().then(() => {
            return db.activities.findAll()
        })
        
        return res.render("calculatezones.ejs", {
            base_url,
            activities
        })
    },
    getdistanceforactivity: async (req, res) => {
        const activity=req.params.activity;
        let distanceforactivity=0;
        const distance=await db.activites_classification.sync().then(()=>{
            return db.activites_classification.findAll({
                where:{
                    activity_id:parseInt(activity)
                }
            })
        })
        console.log("distance",distance)
        try{
            distanceforactivity=distance[0].distance/1000
        }catch(e){
            distanceforactivity=0
        }
        // const {min,max}=getminandmaxtimerange(distance)
        // const gettimerangeMinandMax=distance
        return res.json({distanceforactivity})
    },
    fetchactivitylevel: async (req, res) => {
        const {activity_id,time,distance}=req.params
        const changedistancetom=(distance)=>(distance)*1000;
        const formattedtime=convertToSQLTimeFormat(time)
        const giventime=formattedtime/changedistancetom(distance)
        const formatteddistance=changedistancetom(distance)
        console.log("distance",distance)
        const activitylevel = await db.activites_classification.sync().then(() => {
            return db.activites_classification.findOne({
                where: {
                    activity_id: parseInt(activity_id),
                    distance: formatteddistance,
                    from_range: {
                      [Op.lte]: formattedtime
                    },
                    end_range: {
                      [Op.gte]: formattedtime
                    }
                  },
                  include: [db.activities, db.levels]
            })
        })
        console.log("formatteddistance",formatteddistance)
        return res.json({ activitylevel })
    },
    generatezonesreport: async (req, res) => {
        const {
            activity_id,
            fitnesslevelid,
            distance,
            time
        }=req.body;
        const changedistancetom=(distance)=>(distance)*1000;
        const formatteddistance=changedistancetom(distance)
        const formattedtime=parseInt(time)
        const outputdistance=formattedtime/formatteddistance;
        console.log("outputdistance",outputdistance)
        console.log("formattedtime",formattedtime)
        console.log("formatteddistance",formatteddistance)
        const zones=await db.zones.sync().then(()=>{
            return db.zones.findAll({
                where:{
                    activity_id:parseInt(activity_id),
                    level_id:parseInt(fitnesslevelid)
                },
                include:[db.activities,db.levels]
            })
        })
       
        const zonesdata=zones.map(zone=>{
            return {
                zone:zone.zone,
                name:zone.name,
                offsetstart:zone.offset_start,
                offsetend:zone.offset_end,
                activity:zone.activity.activity_name,
                pacestart:outputdistance+zone.offset_start,
                paceend:outputdistance+zone.offset_end,
            }
        })
        const otherdata={
            activity:zones[0].activity.activity_name,
            giventime:formattedtime,
            outputtime:outputdistance,
        }
        // if zones is empty then return empty array
        if(zones.length==0){
            return res.json({zonesdata:[],otherdata})
        }
        await db.trainingzones.sync().then(()=>{
            for(let i=0;i<zones.length;i++){
                db.trainingzones.create({
                    zone:zones[i].zone,
                    zone_name:zones[i].name,
                    offset_start:zones[i].offset_start,
                    offset_end:zones[i].offset_end,
                    pace_start_range:outputdistance+zones[i].offset_start,
                    pace_end_range:outputdistance+zones[i].offset_end,
                })
            }
        })
        return res.json({zonesdata,otherdata})
    },

    fetchoptions: async (req, res) => {
        const numofdays = parseInt(req.params.days)
        const daysoptionsfromdb = await db.days_options.sync({ alter: true })
            .then(() => {
                return db.days_options.findAll({ where: { run_days_per_week: numofdays } })
            })


        

        // await db.daysoptions.findOne({where:{run_days_per_week:numofdays}})
        // const options=daysoptions[numofdays]
        let datatosend=[];
        const newdataoptions = daysoptionsfromdb.map(daysoptions =>{ 
            // console.log("daysoptions",daysoptions)
            datatosend.push({id:daysoptions.dayscode,value:daysoptions.options})
        })
        // console.log("newdataoptions",datatosend)
        return res.json({ datatosend })
    },
    fetchdaysoptionvalue: async (req, res) => {
        const daysoptions = await db.days_options.findOne({ where: { dayscode:req.params.dayscode } })
        const value="Monday-" + daysoptions.monday + " Tuesday-" + daysoptions.tuesday + " Wednesday-" + daysoptions.wednesday + " Thursday-" + daysoptions.thursday + " Friday-" + daysoptions.friday + " Saturday-" + daysoptions.saturday+" Sunday-"+daysoptions.sunday
        return res.json({ value })
    },
    
    generatereport: async (req, res) => {
        const { startdate, daysoptions, comboselem } = req.body;
        console.log("comboselem", comboselem)
        const daysoptionsmapping = {
            2: "2_days",
            3: "3_days",
            4: "4_days",
            5: "5_days",
        }
        // const workoutnamemapping = {
        //     1: "long_workout",
        //     4: "short_workout_1",
        //     5: "short_workout_2",
        //     2: "medium_workout_1",
        //     3: "medium_workout_2",
        // }

        const workoutnamemapping = [
            "long_workout",
             
             "medium_workout_1",
             "medium_workout_2",
             "short_workout_1",
             "short_workout_2",
        ]
        const combosArray = comboselem.split("").map(e => parseInt(e));
        const unitofexersice = "KM"
        const totalweeks = await db.running_schedule.count({ distinct: "week" });
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

        let newstartday = getNextCycleDate(startdate, combosArray);
        const alldates = [];
        let week = [];

        for (let i = 0; i < totaldays; i++) {
            let weeknumber = parseInt(i / 7) + 1// Use Math.floor for better readability
           
            // console.log("weeknumber", weeknumber)
            if ((i + 1) % 7 === 0) {
                let weekdata = await db.running_schedule.findOne({ where: { week: weeknumber } })
                let totalquota = weekdata[daysoptionsmapping[daysoptions]]
                // console.log("weekdata", weekdata)
                let newweek=[]
                let workoutnamespliceable = workoutnamemapping.slice();
                week.map((day, index) => {
                   
                    day.quota = (totalquota * (weekdata[workoutnamespliceable[0]] / 100)).toFixed(2) + ' ' + unitofexersice
                    // console.log("weekdata[workoutnamemapping[i]",weekdata[workoutnamemapping[i]])
                    // console.log("workoutnamemapping[i]",workoutnamemapping[i])
                    day.totalquota = totalquota + ' ' + unitofexersice
                    day.workoutname = workoutnamespliceable[0]
                    newweek.push(day)
                    //splice the array from 0th index
                    workoutnamespliceable.splice(0,1)
                    // for (let i = 0; i <= 6; i++) {


                      
                    //     day[`quota${i}`] = i <= daysoptions ? ((totalquota * (weekdata[workoutnamemapping[index]] / 100)).toFixed(2)) + ' ' + unitofexersice : "NULL"
                    //     // console.log("weekdata[workoutnamemapping[i]",weekdata[workoutnamemapping[i]])
                    //     // console.log("workoutnamemapping[i]",workoutnamemapping[i])
                    //     day.totalquota = totalquota + ' ' + unitofexersice
                    //     day.workoutname = workoutnamemapping[i]
                    //     newweek.push(day)
                       
                    // }
                })
                // console.log("weekdata",weekdata)
                // let weekrunningquota = runningquotas?.find(e =>e.week==weeknumber);

                // console.log("weekrunningquota",weekrunningquota)
                // total quota for the week

                // let exerciseobj=await db.exercise_quota.findOne({where:{running_schedule_id:weekdata.id,days:parseInt(daysoptions)}})
                // let exersiceobj = weekrunningquota?.exersicequatos?.find(e => e.days === parseInt(daysoptions));

                // total saved quota
                // let totalquota = exersiceobj?.totalquota;

                //total quoata as added from days quota
                // let totaladdedquota=exersiceobj.workouts.reduce((acc,curr)=>{return acc+curr.pert},0)
                // week.map((day,index)=>{
                //     // console.log("exersiceobj.workouts[index].pert",exersiceobj.workouts[index].pert)
                //     day.quota=totalquota*(exersiceobj.workouts[index].pert/100)
                //     console.log("day.quota",day.quota)
                //     console.log("exerciseobj.workouts[index].pert",exersiceobj.workouts[index].pert)

                //     day.totalquota=totalquota
                // })
                alldates.push({ week: weeknumber, weekdates: [...week], totalquota });
                week = [];
            }

            let date = new Date(newstartday);
            date.setDate(date.getDate() + i);
            let newdate = date.toISOString().split("T")[0];
            let newday = date.getDay();

            if (combosArray.includes(newday)) {
                week.push({
                    newdate,
                    newday: maptotextualday[newday],
                    newweek: parseInt(weeknumber)
                });
            }
        }

        return res.json({ alldates });
    },

    // generatereportv2: async (req, res) => {
    //     const { startdate, daysoptions, comboselem ,phaseno} = req.body;
    //     console.log("comboselem", comboselem)
    //     const daysoptionsmapping = {
    //         2: "2_days",
    //         3: "3_days",
    //         4: "4_days",
    //         5: "5_days",
    //     }
    //     // const workoutnamemapping = {
    //     //     1: "long_workout",
    //     //     4: "short_workout_1",
    //     //     5: "short_workout_2",
    //     //     2: "medium_workout_1",
    //     //     3: "medium_workout_2",
    //     // }
    //     const workouts=await db.workout.sync().then(async()=>{
    //         return db.workout.findAll()
    //     })
    //     const workoutids=workouts.map(e=>{
    //         return {
    //             id:e.id,
    //             workout:e.workout
    //         }
    //     })
    //     // console.log("workoutids",workouts)
    //     const workoutnamemapping = [
    //        { index:1,value:"long_workout"},
             
    //          {index:2,value:"medium_workout_1"},
    //          {index:3,value:"medium_workout_2"},
    //          {index:4,value:"short_workout_1"},
    //          {index:5,value:"short_workout_2"},
    //     ]
    //     const combosArray = comboselem.split("").map(e => parseInt(e));
    //     const unitofexersice = "KM"
    //     const totalweeks = await db.running_schedule.count({ distinct: "week" });
    //     const totaldays = totalweeks * 7;
    //     const maptotextualday = {
    //         0: "Sunday",
    //         1: "Monday",
    //         2: "Tuesday",
    //         3: "Wednesday",
    //         4: "Thursday",
    //         5: "Friday",
    //         6: "Saturday"
    //     };

    //     let newstartday = getNextCycleDate(startdate, combosArray);
    //     const alldates = [];
    //     let week = [];

    //     //subactivity

    //     const subactivity=await db.phasesubactivity.sync().then(()=>{
    //         return db.phasesubactivity.findAll(
    //             {
    //                 include:[db.subworkout,db.workout,db.phasename]
    //             }
    //         )
    //     })
     
    //     //check multiple occurances of same phaseno


    
    //     // get distinct phase ids
    //     const allphaseids=subactivity.map(e=>e.phase_id)
       
    //     const distinctphaseids=[...new Set(allphaseids)]
       
    //     // get all occurances of phase ids
    //     const numberofoccrances=distinctphaseids.map(e=>{
    //         const occur=allphaseids.map((e1,index)=>{
    //             if(e1==e){
    //                 return index
    //             }
    //             return null
    //         })
    //         const removenull=occur.filter(e=>e!=null)
    //         return {e,occured:removenull.length,index:removenull}
    //     })
    //     // console.log("numberofoccrances",numberofoccrances)



       

    //     // subactivity
    //     let numberofoccurenceMutable=numberofoccrances.slice();
    //     // console.log("before numberofoccurenceMutable",numberofoccurenceMutable)
    //     for (let i = 0; i < totaldays; i++) {
    //         let weeknumber = parseInt((i)/ 7)+1// Use Math.floor for better readability
    //         // console.log("weeknumber", weeknumber)
    //         // console.log("phasenofortheweek",phasenofortheweek)
           
    //         // return
    //         // return res.json({subactivityforweek})
    //         // console.log("subactivityforweek",subactivityforweek.dataValues)
    //         // console.log("weeknumber", weeknumber)
    //         if ((i + 1) % 7 === 0) {
    //             const phasenofortheweek=await db.phase.sync().then(()=>{
                    
    //                 return db.phase.findOne({where:{phaseno:parseInt(phaseno),week:weeknumber}})
    //             })
    //             // console.log("phaseno",phaseno,"weeknumber",weeknumber,"phasenofortheweek.phase",phasenofortheweek.phase)
    //             let weekdata = await db.running_schedule.findOne({ where: { week: weeknumber } })
    //             // return res.json({weekdata})
    //             let totalquota = weekdata[daysoptionsmapping[daysoptions]]
    //             // console.log("weekdata", weekdata)
    //             let newweek=[]
    //             let workoutnamespliceable = workoutnamemapping.slice();
    //             for(index=0;index<week.length;index++){
    //                 const day=week[index]
                   
    //                 // console.log("suitablesubactivityid",suitablesubactivityid)
                    

    //                 // console.log("workoutnamespliceable[0]",workoutnamespliceable[0],"phasenofortheweek.phase",phasenofortheweek.phase)
    //                 let occurance=numberofoccurenceMutable.find(e=>e.e==phasenofortheweek.phase)
                    
    //                if(occurance==undefined){
    //                 numberofoccurenceMutable=numberofoccrances.slice();
    //                 occurance=numberofoccurenceMutable.find(e=>e.e==phasenofortheweek.phase)
    //                }

                 
    //                 // console.log("numberofoccrances",numberofoccrances)
    //                 let suitablesubactivityid=occurance.index.map(e => {
    //                     const indexofactivity= subactivity.findIndex(newe=>newe.workout_id==workoutnamespliceable[0]["index"])
    //                     if(e==indexofactivity){
    //                         return indexofactivity
    //                     }
    //                 })[0];
                  
    //                 //
                   
                    
                  
    //                 // console.log("suitablesubactivityid",suitablesubactivityid)
    //                 // const subactivityid=occurance.index[0]
    //                 // console.log("before numberofoccurenceMutable",numberofoccurenceMutable)
                  
    //                 // console.log("after numberofoccurenceMutable",numberofoccurenceMutable)
    //                 const subactivityfortheday=subactivity[suitablesubactivityid]
    //                 console.log("suitablesubactivityid",suitablesubactivityid,"subactivityfortheday",subactivityfortheday)

    //                 // if(subactivityfortheday.phase_id==1){
    //                 //     // console.log("subactivityfortheday",subactivityfortheday)
    //                 // }
    //                 // sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,suitablesubactivityid)
    //                 // console.log("phaseno",phaseno,"weeknumber",weeknumber,"phasenofortheweek.phase",phasenofortheweek.phase)
    //                 // console.log("subactivityfortheday",subactivityfortheday)
    //                 // console.log("subactivityfortheday",subactivityfortheday)
    //                 day.quota = (totalquota * (weekdata[workoutnamespliceable[0]["value"]] / 100)).toFixed(2) + ' ' + unitofexersice
                    
    //                 day.phase=subactivityfortheday.phasename.phase;
                    
                    
    //                 // console.log("weekdata[workoutnamemapping[i]",weekdata[workoutnamemapping[i]])
    //                 // console.log("workoutnamemapping[i]",workoutnamemapping[i])
    //                 day.totalquota = totalquota + ' ' + unitofexersice

    //                 day.workoutname = subactivityfortheday.workout.workout
    //                 day.subworkout=subactivityfortheday.subworkout.subworkout
                    
                    
    //                 newweek.push(day)
    //                 //splice the array from 0th index
    //                 workoutnamespliceable.splice(0,1)
                   
    //             }
               
    //             alldates.push({ week: weeknumber, weekdates: [...week], totalquota });
    //             week = [];
    //         }

    //         let date = new Date(newstartday);
    //         date.setDate(date.getDate() + i);
    //         let newdate = date.toISOString().split("T")[0];
    //         let newday = date.getDay();

    //         if (combosArray.includes(newday)) {
    //             week.push({
    //                 newdate,
    //                 newday: maptotextualday[newday],
    //                 newweek: parseInt(weeknumber)
    //             });
    //         }
           
    //     }
    //     // console.log("after numberofoccurenceMutable",numberofoccurenceMutable)
    //     return res.json({ alldates });
    // }

    generatereportv2: async (req, res) => {
        const { startdate, daysoptions, comboselem ,phaseno} = req.body;
        
        const daysoptionsmapping = {
            2: "2_days",
            3: "3_days",
            4: "4_days",
            5: "5_days",
        }
      
        const workouts=await db.workout.sync().then(async()=>{
            return db.workout.findAll()
        })
      
        const workoutnamemapping = [
           { index:1,value:"long_workout"},
             
             {index:2,value:"medium_workout_1"},
             {index:3,value:"medium_workout_2"},
             {index:4,value:"short_workout_1"},
             {index:5,value:"short_workout_2"},
        ]
        const combosArray = comboselem.split("").map(e => parseInt(e));
        const unitofexersice = "KM"
        const totalweeks = await db.running_schedule.count({ distinct: "week" });
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

        let newstartday = getNextCycleDate(startdate, combosArray);
        const alldates = [];
        let week = [];

        //subactivity

        const subactivity=await db.phasesubactivity.sync().then(()=>{
            return db.phasesubactivity.findAll(
                {
                    include:[db.subworkout,db.workout,db.phasename]
                }
            )
        })
     
        //check multiple occurances of same phaseno


    
        // get distinct phase ids
        const allphaseids=subactivity.map(e=>e.phase_id)
       
        const distinctphaseids=[...new Set(allphaseids)]
       
        // get all occurances of phase ids
        const numberofoccrances=distinctphaseids.map(e=>{
            const occur=allphaseids.map((e1,index)=>{
                if(e1==e){
                    return subactivity[index]
                }
                return null
            })
            const removenull=occur.filter(e=>e!=null)
           
           
          
            return {e,occured:removenull.length,index:removenull}
        })
        // return res.json(numberofoccrances)
      



       

        // subactivity
        let numberofoccurenceMutable=numberofoccrances.slice();
        // console.log("before numberofoccurenceMutable",numberofoccurenceMutable)
        for (let i = 0; i < totaldays; i++) {
            let weeknumber = parseInt((i)/ 7)+1// Use Math.floor for better readability
          
            if ((i + 1) % 7 === 0) {
                const phasenofortheweek=await db.phase.sync().then(()=>{
                    
                    return db.phase.findOne({where:{phaseno:parseInt(phaseno),week:weeknumber}})
                })
            
                let weekdata = await db.running_schedule.findOne({ where: { week: weeknumber } })
            
                let totalquota = weekdata[daysoptionsmapping[daysoptions]]
              
                let newweek=[]
                let workoutnamespliceable = workoutnamemapping.slice();
                for(index=0;index<week.length;index++){
                    const day=week[index]
                 
                    
                 
                    let occurance=numberofoccurenceMutable.find(e=>e.e==phasenofortheweek.phase)
                    let indexofacitivity=occurance.index.findIndex(e=>e.workout_id===workoutnamespliceable[0]["index"])
                   
                    let subactivityfortheday=occurance.index[indexofacitivity]
                    if(indexofacitivity==-1 || indexofacitivity==undefined){
                        return res.json({indexofacitivity,numberofoccurenceMutable,day,weeknumber,phase:phasenofortheweek.phase,indexofday:index})
                    }

                    // let subactivityfortheday=sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,workoutnamespliceable[0]["index"])
                   
                    day.quota = (totalquota * (weekdata[workoutnamespliceable[0]["value"]] / 100)).toFixed(2) + ' ' + unitofexersice
                    //  console.log("index of loop i,index",i,index)
                    day.phase=subactivityfortheday.phasename.phase;
                    
                    
                 
                    day.totalquota = totalquota + ' ' + unitofexersice

                    day.workoutname = subactivityfortheday.workout.workout
                    day.subworkout=subactivityfortheday.subworkout.subworkout
                    
                    
                    newweek.push(day)
                  
                    sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,indexofacitivity,workoutnamespliceable[0]["index"])
                    workoutnamespliceable.splice(0,1)
                    
                    // return res.json(numberofoccurenceMutable)
                }
               
                alldates.push({ week: weeknumber, weekdates: [...week], totalquota });
                week = [];
            }

            let date = new Date(newstartday);
            date.setDate(date.getDate() + i);
            let newdate = date.toISOString().split("T")[0];
            let newday = date.getDay();

            if (combosArray.includes(newday)) {
                week.push({
                    newdate,
                    newday: maptotextualday[newday],
                    newweek: parseInt(weeknumber)
                });
            }
           
        }
        // console.log("after numberofoccurenceMutable",numberofoccurenceMutable)
        //feed data to workoutschedule
        await db.workout_schedule.sync().then(async()=>{
            for(let k=0;k<alldates.length;k++){
                let newweek=alldates[k].weekdates
                console.log("newweek",newweek)
                for(let l=0;l<newweek.length;l++){
                let newday=newweek[l]
                await db.workout_schedule.create({
                    week: alldates[k].week,
                    date: newday.newdate,
                    day: newday.newday,
                    total_quota_for_week: newday.totalquota,
                    day_quota: newday.quota,
                    phase: newday.phase,
                    workout: newday.workoutname,
                    sub_workout:newday.subworkout
                });
                }
             
            }
        })
        return res.json({ alldates });
    },

    // generatereportv2: async (req, res) => {
    //     const { startdate, daysoptions, comboselem ,phaseno} = req.body;
        
    //     const daysoptionsmapping = {
    //         2: "2_days",
    //         3: "3_days",
    //         4: "4_days",
    //         5: "5_days",
    //     }
      
    //     const workouts=await db.workout.sync().then(async()=>{
    //         return db.workout.findAll()
    //     })
      
    //     const workoutnamemapping = [
    //        { index:1,value:"long_workout"},
             
    //          {index:2,value:"medium_workout_1"},
    //          {index:3,value:"medium_workout_2"},
    //          {index:4,value:"short_workout_1"},
    //          {index:5,value:"short_workout_2"},
    //     ]
    //     const combosArray = comboselem.split("").map(e => parseInt(e));
    //     const unitofexersice = "KM"
    //     const totalweeks = await db.running_schedule.count({ distinct: "week" });
    //     const totaldays = totalweeks * 7;
    //     const maptotextualday = {
    //         0: "Sunday",
    //         1: "Monday",
    //         2: "Tuesday",
    //         3: "Wednesday",
    //         4: "Thursday",
    //         5: "Friday",
    //         6: "Saturday"
    //     };

    //     let newstartday = getNextCycleDate(startdate, combosArray);
    //     const alldates = [];
    //     let week = [];

    //     //subactivity

    //     const subactivity=await db.phasesubactivity.sync().then(()=>{
    //         return db.phasesubactivity.findAll(
    //             {
    //                 include:[db.subworkout,db.workout,db.phasename]
    //             }
    //         )
    //     })
     
    //     //check multiple occurances of same phaseno


    
    //     // get distinct phase ids
    //     const allphaseids=subactivity.map(e=>e.phase_id)
       
    //     const distinctphaseids=[...new Set(allphaseids)]
       
    //     // get all occurances of phase ids
    //     const numberofoccrances=distinctphaseids.map(e=>{
    //         const occur=allphaseids.map((e1,index)=>{
    //             if(e1==e){
    //                 return subactivity[index]
    //             }
    //             return null
    //         })
    //         const removenull=occur.filter(e=>e!=null)
           
           
          
    //         return {e,occured:removenull.length,index:removenull}
    //     })
    //     // return res.json(numberofoccrances)
      



       

    //     // subactivity
    //     let numberofoccurenceMutable=numberofoccrances.slice();
      
    //     // console.log("before numberofoccurenceMutable",numberofoccurenceMutable)
    //     for (let i = 0; i < totaldays; i++) {
    //         let weeknumber = parseInt((i)/ 7)+1// Use Math.floor for better readability
          
    //         if ((i + 1) % 7 === 0) {
    //             const phasenofortheweek=await db.phase.sync().then(()=>{
                    
    //                 return db.phase.findOne({where:{phaseno:parseInt(phaseno),week:weeknumber}})
    //             })
            
    //             let weekdata = await db.running_schedule.findOne({ where: { week: weeknumber } })
            
    //             let totalquota = weekdata[daysoptionsmapping[daysoptions]]
              
    //             let newweek=[]
    //             let workoutnamespliceable = workoutnamemapping.slice();
    //             for(index=0;index<week.length;index++){
    //                 const day=week[index]
                 
    //                 let occurance=numberofoccurenceMutable.find(e=>e.e==phasenofortheweek.phase)
    //                 let indexofacitivity=occurance.index.findIndex(e=>e.workout_id===workoutnamespliceable[0]["index"])
                   
    //                 let subactivityfortheday=occurance.index[indexofacitivity]
    //                 if(indexofacitivity==-1 || indexofacitivity==undefined){
    //                     return res.json({indexofacitivity,numberofoccurenceMutable,day,weeknumber,phase:phasenofortheweek.phase,indexofday:index})
    //                 }
    //                 day.quota = (totalquota * (weekdata[workoutnamespliceable[0]["value"]] / 100)).toFixed(2) + ' ' + unitofexersice
                    
    //                                 day.phase=subactivityfortheday.phasename.phase;
                                    
                                    
    //                                 // console.log("weekdata[workoutnamemapping[i]",weekdata[workoutnamemapping[i]])
    //                                 // console.log("workoutnamemapping[i]",workoutnamemapping[i])
    //                                 day.totalquota = totalquota + ' ' + unitofexersice
                
    //                                 day.workoutname = subactivityfortheday.workout.workout
    //                                 day.subworkout=subactivityfortheday.subworkout.subworkout
                                    
                                    
    //                                 newweek.push(day)
    //                                 //splice the array from 0th index
                                    
    //                 sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,indexofacitivity,workoutnamespliceable[0]["index"])
    //                 workoutnamespliceable.splice(0,1)
                 
                    
    //                 // return res.json(numberofoccurenceMutable)
    //             }
               
    //             alldates.push({ week: weeknumber, weekdates: [...week], totalquota });
    //             week = [];
    //         }
         
    //         let date = new Date(newstartday);
    //         date.setDate(date.getDate() + i);
    //         let newdate = date.toISOString().split("T")[0];
    //         let newday = date.getDay();

    //         if (combosArray.includes(newday)) {
    //             week.push({
    //                 newdate,
    //                 newday: maptotextualday[newday],
    //                 newweek: parseInt(weeknumber)
    //             });
    //         }
           
    //     }
    //     // console.log("after numberofoccurenceMutable",numberofoccurenceMutable)
    //     //feed data to workoutschedule
     
    //     return res.json({ alldates });
    // }
    renderWorkoutview: async (req, res) => {},
    showWorkoutreport:async (req, res) => {},
    renderZonesReportview:async (req, res) => {},
    showzonesreport:async (req, res) => {},

}