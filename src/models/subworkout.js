module.exports = function(sequelize, DataTypes) {
    const subworkout = sequelize.define('subworkout', {
        id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
},
        subworkout: {
    type: DataTypes.STRING
}
    }, {
        timestamps: false,
        tableName: 'subworkout'
    });
    subworkout.associate = function(models) {
        
    };
    return subworkout;
};