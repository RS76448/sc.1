/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('running_schedule', {
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
		}
	}, {
		tableName: 'running_schedule',
		timestamps: false,
		engine: 'InnoDB',
		charset: 'utf8mb4'
	});
};
