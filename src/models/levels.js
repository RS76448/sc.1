module.exports = function(sequelize, DataTypes) {
	return sequelize.define('levels', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
          },
          level: {
            type: DataTypes.STRING(50),
          },
        }, {
          timestamps: false,
        });
};





