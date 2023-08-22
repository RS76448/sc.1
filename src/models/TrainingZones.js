module.exports = function(sequelize, DataTypes) {
    const trainingzones= sequelize.define('trainingzones', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        user_id:{
            type: DataTypes.INTEGER,
        },
        date:{
            type: DataTypes.DATE,
        },
        zone: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        zone_name: {
            type: DataTypes.STRING(255),
            allowNull: false,
        },
        offset_start: {
            type: DataTypes.DECIMAL(10, 3),
            allowNull: false,
        },
        offset_end: {
            type: DataTypes.DECIMAL(10, 3),
            allowNull: false,
        },
        pace_start_range: {
            type: DataTypes.DECIMAL(10, 3),
            allowNull: false,
        },
        pace_end_range: {
            type: DataTypes.DECIMAL(10, 3),
            allowNull: false,
        },
        identifier:{
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        fitnesslevel_id:{
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        activity_id:{
            type: DataTypes.INTEGER,
            allowNull: false,
        }
    }, {
        timestamps: false,
        tableName:"trainingzones"
    });
    trainingzones.associate = function(models) {
        trainingzones.belongsTo(models.users, { foreignKey: 'user_id', targetKey: 'id' });
        trainingzones.belongsTo(models.levels, { foreignKey: 'fitnesslevel_id', targetKey: 'id' });
        
    };
    return trainingzones;
};
