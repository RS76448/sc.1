const base_url = "http://localhost:3000";
const daysoptions = require("../models/daysoptions")
const runningquotas = require("../models/runningquotas")
const db = require("../config/db")
const { Op } = require('sequelize');
const {convertToSQLTimeFormat}=require("../utils/timeutils")
const {getminandmaxtimerange}=require("../utils/timeutils")
const { getNextCycleDate } = require("../utils/dateutils")
const {sliceOccurences,generateRandomString}=require("../utils/datautils")
module.exports = {
    renderGenerateWorkoutReportView: async (req, res) => {
       
        return res.render("fn.ejs", {
            base_url
        })
    },
    renderGenerateWorkoutReportViewv2: async (req, res) => {
        
        return res.render("fn1.ejs", {
            base_url
        })
    },
    renderGeneratezonesReportView: async (req, res) => {
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
        let randomstring=generateRandomString(12)
        await db.trainingzones.sync().then(()=>{
            
            for(let i=0;i<zones.length;i++){
                db.trainingzones.create({
                    zone:zones[i].zone,
                    identifier:randomstring,
                    zone_name:zones[i].name,
                    offset_start:zones[i].offset_start,
                    offset_end:zones[i].offset_end,
                    pace_start_range:outputdistance+zones[i].offset_start,
                    pace_end_range:outputdistance+zones[i].offset_end,
                })
            }
        })
        return res.json({zonesdata,otherdata,randomstring})
    },

    fetchoptions: async (req, res) => {
        const numofdays = parseInt(req.params.days)
        const daysoptionsfromdb = await db.days_options.sync({ alter: true })
            .then(() => {
                return db.days_options.findAll({ where: { run_days_per_week: numofdays } })
            })


        

    
        let datatosend=[];
        const newdataoptions = daysoptionsfromdb.map(daysoptions =>{ 
          
            datatosend.push({id:daysoptions.dayscode,value:daysoptions.options})
        })
        // console.log("newdataoptions",datatosend)
        return res.json({ datatosend })
    },
    fetchdaysoptionvalue: async (req, res) => {
        const daysoptions = await db.days_options.findOne({ where: { run_days_per_week: req.params.numofdays,options:parseInt(req.params.options) } })
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
                 
                    day.totalquota = totalquota + ' ' + unitofexersice
                    day.workoutname = workoutnamespliceable[0]
                    newweek.push(day)
                    //splice the array from 0th index
                    workoutnamespliceable.splice(0,1)
                  
                })
             
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

  

    generatereportv2: async (req, res) => {
        const { startdate, daysoptions, comboselem ,phaseno} = req.body;
        const dayscombo=await db.days_options.sync().then(()=>{
            return db.days_options.findOne({where:{run_days_per_week:parseInt(daysoptions),options:parseInt(comboselem)}})
        })
        const daysoptionsmapping = {
            2: "2_days",
            3: "3_days",
            4: "4_days",
            5: "5_days",
        }
      
        const workouts=await db.days_options.sync().then(async()=>{
            return db.days_options.findOne({
                where:{
                    run_days_per_week:parseInt(daysoptions),
                    options:parseInt(comboselem)

                }
            })
        })
      
        // const workoutnamemapping = [
        //    { index:1,value:"long_workout"},
             
        //      {index:2,value:"medium_workout_1"},
        //      {index:3,value:"medium_workout_2"},
        //      {index:4,value:"short_workout_1"},
        //      {index:5,value:"short_workout_2"},
        // ]
        const workoutnamemapping = [
            {index:1,value:workouts.sunday,day:"Sunday"},
            {index:2,value:workouts.monday,day:"Monday"},
            {index:3,value:workouts.tuesday,day:"Tuesday"},
            {index:4,value:workouts.wednesday,day:"Wednesday"},
            {index:5,value:workouts.thursday,day:"Thursday"},
            {index:6,value:workouts.friday, day:"Friday"},
            {index:7,value:workouts.saturday,day:"Saturday"},
        ]

        const workoutmapping2={
            "Long Workout":"long_workout",
            "Medium Workout 1":"medium_workout_1",
            "Medium Workout 2":"medium_workout_2",
            "Short Workout 1":"short_workout_1",
            "Short Workout 2":"short_workout_2",
        
        }
        console.log("workoutnamemapping",workoutnamemapping)
        const combosArray = dayscombo.dayscode.split("").map(e => parseInt(e));
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
                    let desiganatedworkoutfortheday=workoutnamespliceable.find(d=>d.day==day.newday)["value"]
                    console.log("desiganatedworkoutfortheday",desiganatedworkoutfortheday)
                    let indexofacitivity=occurance.index.findIndex(e=>e.workout.workout==desiganatedworkoutfortheday)
                    console.log("indexofacitivity",indexofacitivity)
                    let subactivityfortheday=occurance.index[indexofacitivity]
                    if(indexofacitivity==-1 || indexofacitivity==undefined){
                        return res.json({indexofacitivity,occurance,day,weeknumber,phase:phasenofortheweek.phase,indexofday:index})
                    }

                    // let subactivityfortheday=sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,workoutnamespliceable[0]["index"])
                   
                    day.quota = (totalquota * (weekdata[workoutmapping2[desiganatedworkoutfortheday]] / 100)).toFixed(2) + ' ' + unitofexersice
                    //  console.log("index of loop i,index",i,index)
                    day.phase=subactivityfortheday.phasename.phase;
                    day.phaseid=subactivityfortheday.phase_id
                    
                 
                    day.totalquota = totalquota + ' ' + unitofexersice

                    day.workoutname = subactivityfortheday.workout.workout
                    day.subworkout=subactivityfortheday.subworkout.subworkout
                    
                    
                    newweek.push(day)
                  
                    sliceOccurences(numberofoccurenceMutable,phasenofortheweek.phase,indexofacitivity,desiganatedworkoutfortheday)
                    // workoutnamespliceable.splice(0,1)
                    
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
        let randomstring=generateRandomString(12)
        await db.workout_schedule.sync().then(async()=>{
           
            for(let k=0;k<alldates.length;k++){
                let newweek=alldates[k].weekdates
                // console.log("newweek",newweek)
                for(let l=0;l<newweek.length;l++){
                let newday=newweek[l]
                await db.workout_schedule.create({
                    numofrunningdays:parseInt(daysoptions),
                    daysoption:parseInt(comboselem),
                    week: alldates[k].week,
                    identifier:randomstring,
                    date: newday.newdate,
                    day: newday.newday,
                    total_quota_for_week: newday.totalquota,
                    day_quota: newday.quota,
                    phase_id: newday.phaseid,
                    phase_name:newday.phase,
                    workout: newday.workoutname,
                    sub_workout:newday.subworkout
                });
                }
             
            }
        })
        return res.json({ alldates,randomstring });
    },


    renderWorkoutreportview: async (req, res) => {
        return res.render("generatedWorkoutReports.ejs", {
            base_url
        })
    },
    showWorkoutreport:async (req, res) => {
        const { identifier} = req.body;
        console.log("identifier",identifier)
        // show saved reports in db
        const workoutreports=await db.workout_schedule.sync().then(()=>{
            return db.workout_schedule.findAll({
                where:{
                    identifier:identifier
                }
            })
        })
        return res.json({workoutreports})
    },
    renderZonesReportview:async (req, res) => {
        const activities = await db.activities.sync().then(() => {
            return db.activities.findAll()
        })
        
        return res.render("generatedZonesReport.ejs", {
            base_url,
            activities
        })
    },
    showzonesreport:async (req, res) => {
        const { identifier} = req.body;
        // show saved reports in db
        const zonesreport=await db.trainingzones.sync().then(()=>{
            return db.trainingzones.findAll({
                where:{
                    identifier:identifier
                }
            })
        })
        return res.json({zonesreport})
    },
    rendergetweekvolume:async (req, res) => {
        return res.render("weeklyvolume.ejs", {
            base_url
        })
    },
    getweekvolume:async (req, res) => {
        const {identifier}=req.body;
        const weekvolume=await db.workout_schedule.sync().then(()=>{
            return db.workout_schedule.findAll({
                where:{
                    identifier:identifier
                  
                }
            })
        });
        // const newweekvolume = weekvolume.map((e, index) => {
        //     let totalindextoloop = index + e.numofrunningdays;
        //     let totalactualworkout = 0;
        
        //     for (let i = index; i < totalindextoloop && i < weekvolume.length; i++) {
        //         totalactualworkout += weekvolume[i].actual_workout;
        //     }
        //     e.totalactualworkout="fucker"
        //     if (index === totalindextoloop - 1) {  // Adjusted the condition
        //         e.totalactualworkout = totalactualworkout;
        //     } else {
        //         e.totalactualworkout = 0;
        //     }
        
        //     return e;
        // });
        
        return res.json({weekvolume:weekvolume})
    },
    updateweekvalues:async (req, res) => {
       
        const {identifier,weeknumber,allvaluesforweek}=req.body;
        const removenullfromallvalues=allvaluesforweek.filter(e=>e.actual_workout!='')
        const updateday=removenullfromallvalues?.map(async (e)=>{

        return db.workout_schedule.sync().then(()=>{
            console.log("identifier",identifier)
            console.log("weeknumber",parseInt(weeknumber))
            console.log("e.actual_workout",parseInt(e.actual_workout))
            console.log("e.date",new Date(e.date))
            return db.workout_schedule.update({
                actual_workout:parseFloat(e.actual_workout)
            },{
                where:{
                    identifier:identifier,
                  
                    date:new Date(e.date)
                }
            })
        })
        
        //   return  db.workoutdonebyuserforday.sync().then(()=>{
        //         db.workoutdonebyuserforday.create({
        //             unique_identifier:identifier,
        //             given_workout:parseInt(e.given_workout),
        //             actual_workout:parseInt(e.actual_workout),
        //             date:new Date(e.date)
        //         })
        //     })
        })
        return res.json({workoutreports:updateday})
    }
}