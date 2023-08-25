module.exports = function(sequelize, DataTypes) {
    return sequelize.define('workout_schedule_without_volume', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        week: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        date: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        day: {
            type: DataTypes.STRING(10),
            allowNull: false,
        },
       
        workout: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        sub_workout: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        numofrunningdays:{
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        daysoption:{
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        identifier:{
            type: DataTypes.STRING(50),
            allowNull: false,
        },
      
        goal:{
            type: DataTypes.STRING(50),
            allowNull: true,
        },
        process:{
            type: DataTypes.STRING(50),
            allowNull: true,
        },
       
        sub_workout_id:{
            type: DataTypes.INTEGER,
        },
        process:{
            type: DataTypes.STRING(50),
        }
       
    }, {
        timestamps: false,
        tableName:"workout_schedule_without_volume"
    });
};
