module.exports = function (sequelize, DataTypes) {
    const workoutdonebyuserforday = sequelize.define('workoutdonebyuserforday', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        unique_identifier: {
            type: DataTypes.STRING
        },
        given_workout: {
            type: DataTypes.INTEGER
        },
        actual_workout: {
            type: DataTypes.INTEGER
        },
        date: {
            type: DataTypes.DATE
        }
    }, {
        timestamps: false,
        tableName: 'workoutdonebyuserforday'
    });
    workoutdonebyuserforday.associate = function (models) {

    };
    return workoutdonebyuserforday
};