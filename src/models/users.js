module.exports = function(sequelize, DataTypes) {
    const workout = sequelize.define('users', {
        id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
},
        name: {
    type: DataTypes.STRING
},
dateofbirth: {
    type: DataTypes.DATE
}
    }, {
        timestamps: false,
        tableName: 'users'
    });
    workout.associate = function(models) {
        
    };
    return workout
};