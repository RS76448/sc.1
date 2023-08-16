module.exports = function(sequelize, DataTypes) {
    const zones= sequelize.define('zones', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        activity_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'activities', // name of the referenced table
                key: 'id'
            }
        },
        zone: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        name: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        offset_start: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        offset_end: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        level_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'levels', // name of the referenced table
                key: 'id'
            }
        }
    }, {
        timestamps: false,
    });
    zones.associate = function(models) {
        zones.belongsTo(models.activities, { foreignKey: 'activity_id', targetKey: 'id' });
        zones.belongsTo(models.levels, { foreignKey: 'level_id', targetKey: 'id' });
    };
    return zones;
};
