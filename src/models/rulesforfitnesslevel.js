module.exports = function (sequelize, DataTypes) {
    const rulesforfitnesslevel = sequelize.define('rulesforfitnesslevel', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        level_id: {
            type: DataTypes.INTEGER
        },

        changepercentage: {
            type: DataTypes.FLOAT
        },
    }, {
        timestamps: false,
        tableName: 'rulesforfitnesslevel'
    });
    rulesforfitnesslevel.associate = function (models) {
        rulesforfitnesslevel.belongsTo(models.levels, { foreignKey: 'level_id', targetKey: 'id' });
    };
    return rulesforfitnesslevel
};