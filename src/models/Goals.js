/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	const goals= sequelize.define('goals', {
		week: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true
		},
		'fivedays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'fourdays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'threedays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'twodays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'onedays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'sixdays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
		'sevendays': {
			type: DataTypes.INTEGER,
			allowNull: false
		},
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
