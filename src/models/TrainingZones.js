module.exports = function(sequelize, DataTypes) {
    return sequelize.define('trainingzones', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
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
    }, {
        timestamps: false,
        tablename:"trainingzones"
    });
};
