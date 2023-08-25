const Sequelize = require('sequelize')

var db = {}

let sequelize;
if(process.env.NODE_ENV === 'development'){
  sequelize = new Sequelize('fitness', 'root', '', {
    host: 'localhost',
    port: 3306,
    dialect: 'mysql',
    logging: false
});
}else if(process.env.NODE_ENV === 'production'){
  sequelize = new Sequelize('fitness2', 'root', 'Fitnessapp#121', {
    host: '0.0.0.0',
    port: 3306,
    dialect: 'mysql',
    logging: false
});
}




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
    require("../models/Goals.js"),
    require("../models/users.js"),
    require("../models/rulesforage.js"),
    require("../models/rulesforfitnesslevel.js"),
    require("../models/plannedWorkout.js"),
    require("../models/columnworkoutmapping.js"),
    require("../models/goalswithoutvolume.js"),
    require("../models/workoutschedulewithoutvolume.js"),
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
// sync the db
sequelize.sync()
module.exports = db
