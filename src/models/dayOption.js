/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('days_options', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
          },
          run_days_per_week: {
            type: DataTypes.INTEGER,
          },
          options: {
            type: DataTypes.INTEGER,
          },
          monday: {
            type: DataTypes.STRING(50),
          },
          tuesday: {
            type: DataTypes.STRING(50),
          },
          wednesday: {
            type: DataTypes.STRING(50),
          },
          thursday: {
            type: DataTypes.STRING(50),
          },
          friday: {
            type: DataTypes.STRING(50),
          },
          saturday: {
            type: DataTypes.STRING(50),
          },
          sunday: {
            type: DataTypes.STRING(50),
          }
        }, {
          timestamps: false,
        });
};





