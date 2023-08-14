const express=require('express');
const router=express.Router();
const Fitnesscontroller=require("./fitness.controller")
router.get('/',Fitnesscontroller.renderFn)
router.get('/fetchoptions/:days',Fitnesscontroller.fetchoptions)
router.post('/generatereport',Fitnesscontroller.generatereport)
router.get('/addSchedule',Fitnesscontroller.addSchedule)
module.exports=router