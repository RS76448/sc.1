const Sequelize = require('sequelize')

var db = {}

// const sequelize = new Sequelize('fitness', 'root', '', {
//     host: 'localhost',
//     port: 3306,
//     dialect: 'mysql',
//     logging: false
// });

const sequelize = new Sequelize('running_schedule', 'root', 'Fitnessapp#121', {
    host: '0.0.0.0',
    port: 3306,
    dialect: 'mysql',
    logging: false
});


sequelize.authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });
let models = [
    require("../models/running_schedule.js"),
    require("../models/daysoptions.js"),
    require("../models/activities.js"),
    require("../models/levels.js"),
    require("../models/activites_classification.js"),
    require("../models/zones.js"),
    require("../models/phase.js"),
    require("../models/phasename.js"),
    require("../models/phasesubactivity.js"),
    require("../models/subworkout.js"),
    require("../models/workout.js"),
    require("../models/WorkoutSchedule.js"),
    require("../models/TrainingZones.js"),
    require("../models/workoutdonebyuser.js"),


]

// Initialize models
models.forEach(model => {
    const seqModel = model(sequelize, Sequelize)
    db[seqModel.name] = seqModel
})

// Apply associations
Object.keys(db).forEach(key => {
    if ('associate' in db[key]) {
        db[key].associate(db)
    }
})

db.sequelize = sequelize
db.Sequelize = Sequelize

module.exports = db
