const base_url="http://localhost:3000";
const daysoptions=require("../models/daysoptions")
const runningquotas=require("../models/runningquotas")
const db=require("../config/db")
const {getNextCycleDate}=require("../utils/dateutils")
module.exports={
    addSchedule:async(req,res)=>{
        return res.render("addSchedule.ejs",{
            base_url
        })
    },
    renderFn:async(req,res)=>{
        // db.running_schedule.sync({ alter: true })
        // .then(() => {
        //   console.log('Model synchronized with database');
        // })
        // .catch(err => {
        //   console.error('Error synchronizing model:', err);
        // });
      
        //send data to the frontend
        // const data=await db.running_schedule.findAll()
        // return res.send(data)
        return res.render("fn.ejs",{
            base_url
        })
    },
    fetchoptions:(req,res)=>{
        const numofdays=parseInt(req.params.days)
        const options=daysoptions[numofdays]
        return res.json({options})
    },


    generatereport : async(req, res) => {
        const { startdate, daysoptions, comboselem } = req.body;
        const daysoptionsmapping={
            2:"2_days",
            3:"3_days",
            4:"4_days",
            5:"5_days",
        }
        const workoutnamemapping={
            1:"long_workout",
            4:"short_workout_1",
            5:"short_workout_2",
            2:"medium_workout_1",
            3:"medium_workout_2",
        }
        const combosArray = comboselem.split(" ").map(e => parseInt(e));
        const unitofexersice="KM"
        const totalweeks = await db.running_schedule.count({distinct:"week"});
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
            let weeknumber = parseInt(i/7)+1// Use Math.floor for better readability
            console.log("weeknumber",weeknumber)
            if ((i + 1) % 7 === 0) {
                let weekdata=await db.running_schedule.findOne({where:{week:weeknumber}})
                let totalquota=weekdata[daysoptionsmapping[daysoptions]]
                console.log("weekdata",weekdata)
                week.map((day,index)=>{
                    for(let i=1;i<=5;i++){
                       
                       
                        day[`quota${i}`]= i<=daysoptions?((totalquota*(weekdata[workoutnamemapping[i]]/100)).toFixed(2))+' '+unitofexersice:"NULL"
                        // console.log("weekdata[workoutnamemapping[i]",weekdata[workoutnamemapping[i]])
                        // console.log("workoutnamemapping[i]",workoutnamemapping[i])
                        day.totalquota=totalquota+' '+unitofexersice
                    }
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

   

}