const Sequelize = require('sequelize')

var db = {}

// const sequelize = new Sequelize('running_schedule', 'root', '', {
//     host: 'localhost',
//     port: 3306,
//     dialect: 'mysql'
// });

const sequelize = new Sequelize('running_schedule', 'root', 'Fitnessapp#121', {
    host: '127.0.0.1',
    port: 3306,
    dialect: 'mysql'
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
