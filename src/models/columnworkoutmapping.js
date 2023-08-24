module.exports = function (sequelize, DataTypes) {
    return sequelize.define('columnworkoutmapping', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },



        activities: {
            type: DataTypes.STRING(50),
        },
        columnname: {
            type: DataTypes.STRING(50),
        },
        workout: {
            type: DataTypes.STRING(50),
        }
    }, {
        timestamps: false,
        tableName: 'columnworkoutmapping'
    });
};





