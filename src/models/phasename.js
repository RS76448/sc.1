module.exports = function (sequelize, DataTypes) {
    const phasename = sequelize.define('phasename', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        phase: {
            type: DataTypes.STRING
        }


    }, {
        timestamps: false,
        tableName: 'phasename'
    })

    return phasename;
};