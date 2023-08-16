module.exports = function(sequelize, DataTypes) {
    const activites_classification= sequelize.define('activites_classification', {
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
        distance: {
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
        },
        from_range: {
            type: DataTypes.TIME,
            allowNull: false
        },
        end_range: {
            type: DataTypes.TIME,
            allowNull: false
        }
    }, {
        timestamps: false
    });
    activites_classification.associate = function(models) {
        activites_classification.belongsTo(models.activities, { foreignKey: 'activity_id', targetKey: 'id' });
        activites_classification.belongsTo(models.levels, { foreignKey: 'level_id', targetKey: 'id' });
    };
    return activites_classification;
};
