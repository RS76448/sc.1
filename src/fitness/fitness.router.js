const express=require('express');
const router=express.Router();
const Fitnesscontroller=require("./fitness.controller")

//weekly workout report
router.get('/generateworkoutreport',Fitnesscontroller.renderGenerateWorkoutReportView)
      .post('/generateworkoutreport',Fitnesscontroller.generatereport);
router.get('/generateworkoutreportv2',Fitnesscontroller.renderGenerateWorkoutReportViewv2)
       .post('/generateworkoutreportv2',Fitnesscontroller.generatereportv2);
router.get('/getworkoutreport',Fitnesscontroller.renderWorkoutreportview)
       .post('/getworkoutreport',Fitnesscontroller.showWorkoutreport);



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