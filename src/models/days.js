/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('days_options', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
          },
          day: {
            type: DataTypes.INTEGER,
          },
          
        }, {
          timestamps: false,
        });
};





