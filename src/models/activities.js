module.exports = function(sequelize, DataTypes) {
	return sequelize.define('activities', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
          },
          activity_name: {
            type: DataTypes.STRING(50),
          },
        }, {
          timestamps: false,
        });
};





