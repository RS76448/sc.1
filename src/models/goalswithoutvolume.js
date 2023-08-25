/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	const goalswithoutvolume= sequelize.define('goalswithoutvolume', {
		
		
		first: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		second: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		third: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		fourth: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		fifth: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		sixth: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		seventh: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
        goal:{
            type: DataTypes.STRING,
            allowNull: false
        },
        activity_id:{
            type: DataTypes.INTEGER,
            allowNull: false
        }
	}, {
		tableName: 'goalswithoutvolume',
		timestamps: false,
		engine: 'InnoDB',
		charset: 'utf8mb4'
	});
    goalswithoutvolume.associate = function(models) {
    goalswithoutvolume.belongsTo(models.subworkout, { as: '1', foreignKey: 'first', targetKey: 'id' });
    goalswithoutvolume.belongsTo(models.subworkout, { as: '2', foreignKey: 'second', targetKey: 'id' });
    goalswithoutvolume.belongsTo(models.subworkout, { as: '3', foreignKey: 'third', targetKey: 'id' });
    goalswithoutvolume.belongsTo(models.subworkout, { as: '4', foreignKey: 'fourth', targetKey: 'id' });
    goalswithoutvolume.belongsTo(models.subworkout, { as: '5', foreignKey: 'fifth', targetKey: 'id' });
    goalswithoutvolume.belongsTo(models.subworkout, { as: '6', foreignKey: 'sixth', targetKey: 'id' });
    goalswithoutvolume.belongsTo(models.subworkout, { as: '7', foreignKey: 'seventh', targetKey: 'id' });
};




    return goalswithoutvolume;
};
