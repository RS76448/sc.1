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
          day: {
            type: DataTypes.STRING(50),
          },
         workout:{
            type: DataTypes.STRING(50),
         }
        }, {
          timestamps: false,
        });
};





