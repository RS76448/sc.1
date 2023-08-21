/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	const goals= sequelize.define('goals', {
		week: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		'5_days': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'4_days': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'3_days': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'2_days': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		long_workout: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		medium_workout_1: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		medium_workout_2: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		short_workout_1: {
			type: DataTypes.DECIMAL(5, 2),
			allowNull: false
		},
		short_workout_2: {
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
		tableName: 'goals',
		timestamps: false,
		engine: 'InnoDB',
		charset: 'utf8mb4'
	});
    goals.associate = function(models) {
        goals.belongsTo(models.activities, { foreignKey: 'activity_id', targetKey: 'id' });
       
    };
    return goals;
};
