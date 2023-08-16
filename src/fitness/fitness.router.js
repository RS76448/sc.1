const express=require('express');
const router=express.Router();
const Fitnesscontroller=require("./fitness.controller")
router.get('/',Fitnesscontroller.renderFn)
router.get('/fetchoptions/:days',Fitnesscontroller.fetchoptions)
router.post('/generatereport',Fitnesscontroller.generatereport)
router.get('/calculatezones',Fitnesscontroller.getzones)
router.get('/addSchedule',Fitnesscontroller.addSchedule)
router.get('/fetchdaysoptionvalue/:dayscode',Fitnesscontroller.fetchdaysoptionvalue)
router.get('/fetchactivitylevel/:activity_id/:time/:distance',Fitnesscontroller.fetchactivitylevel)
router.post('/generatezonesreport',Fitnesscontroller.generatezonesreport)
module.exports=router