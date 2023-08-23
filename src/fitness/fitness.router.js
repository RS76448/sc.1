const express=require('express');
const router=express.Router();
const Fitnesscontroller=require("./fitness.controller")

//weekly workout report
router.get('/generateworkoutreport',Fitnesscontroller.renderGenerateWorkoutReportView)
      .post('/generateworkoutreport',Fitnesscontroller.generatereport);
router.get('/generateworkoutreportv2',Fitnesscontroller.renderGenerateWorkoutReportViewv2)
       .post('/generateworkoutreportv2',Fitnesscontroller.generatereportv2);
router.get('/generateworkoutreportv3',Fitnesscontroller.renderGenerateWorkoutReportViewv3)
       .post('/generateworkoutreportv3',Fitnesscontroller.generatereportv3);
router.get('/generateworkoutreportv4',Fitnesscontroller.renderGenerateWorkoutReportViewv4)
       .post('/generateworkoutreportv4',Fitnesscontroller.generatereportv4);
router.get('/getworkoutreport',Fitnesscontroller.renderWorkoutreportview)
       .post('/getworkoutreport',Fitnesscontroller.showWorkoutreport);
router.get('/plannedworkout/:workout_id/:sub_workout_id/:day_quota',Fitnesscontroller.renderPlannedWorkoutview)
router.get("/addmanualworkout/:id",Fitnesscontroller.addManualWorkout)
       .post("/addmanualworkout",Fitnesscontroller.addManualWorkoutPost)



router.get('/geteditableworkoutreport',Fitnesscontroller.rendergetweekvolume)
       .post('/getweekvolume',Fitnesscontroller.getweekvolume);
router.post('/updateweekvalues',Fitnesscontroller.updateweekvalues);

router.get('/fetchoptions/:days',Fitnesscontroller.fetchoptions)
router.get('/fetchdaysoptionvalue/:options/:numofdays',Fitnesscontroller.fetchdaysoptionvalue)
router.get('/fetchactivitylevel/:activity_id/:time/:distance',Fitnesscontroller.fetchactivitylevel)



//zones
router.get('/generatezonesreport',Fitnesscontroller.renderGeneratezonesReportView)
        .post('/generatezonesreport',Fitnesscontroller.generatezonesreport);
router.get('/getdistanceforactivity/:activity',Fitnesscontroller.getdistanceforactivity)
router.get('/getzonesreport',Fitnesscontroller.renderZonesReportview)
       .post('/getzonesreport',Fitnesscontroller.showzonesreport);
module.exports=router