const Sequelize = require('sequelize');
const setupActivitiesClassificationModel = require('./activities_classification');
const setupActivitiesModel = require('./activities');
const setupLevelsModel = require('./levels');

const sequelize = new Sequelize('database', 'username', 'password', {
    // sequelize config here
});

const ActivitiesClassification = setupActivitiesClassificationModel(sequelize, Sequelize.DataTypes);
const Activities = setupActivitiesModel(sequelize, Sequelize.DataTypes);
const Levels = setupLevelsModel(sequelize, Sequelize.DataTypes);

// Define associations
ActivitiesClassification.belongsTo(Activities, { foreignKey: 'activity_id', targetKey: 'id' });
ActivitiesClassification.belongsTo(Levels, { foreignKey: 'level_id', targetKey: 'id' });

module.exports = {
    ActivitiesClassification,
    Activities,
    Levels,
    sequelize
};
