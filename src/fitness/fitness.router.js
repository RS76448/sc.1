const express=require('express');
const router=express.Router();
const Fitnesscontroller=require("./fitness.controller")
router.get('/',Fitnesscontroller.renderFn)
router.get('/v2',Fitnesscontroller.renderFn1)
router.get('/fetchoptions/:days',Fitnesscontroller.fetchoptions)
router.post('/generatereport',Fitnesscontroller.generatereport)
router.post('/generatereportv2',Fitnesscontroller.generatereportv2)
router.get('/calculatezones',Fitnesscontroller.getzones)
router.get('/addSchedule',Fitnesscontroller.addSchedule)
router.get('/fetchdaysoptionvalue/:dayscode',Fitnesscontroller.fetchdaysoptionvalue)
router.get('/fetchactivitylevel/:activity_id/:time/:distance',Fitnesscontroller.fetchactivitylevel)
router.post('/generatezonesreport',Fitnesscontroller.generatezonesreport)

router.get('/getdistanceforactivity/:activity',Fitnesscontroller.getdistanceforactivity)
module.exports=router