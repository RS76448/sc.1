module.exports = function(sequelize, DataTypes) {
    const workout = sequelize.define('workout', {
        id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
},
        workout: {
    type: DataTypes.STRING
}
    }, {
        timestamps: false,
        tableName: 'workout'
    });
    workout.associate = function(models) {
        
    };
    return workout
};