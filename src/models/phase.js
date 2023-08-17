module.exports = function(sequelize, DataTypes) {
    const phase = sequelize.define('phase', {
        id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
},
        week: {
    type: DataTypes.INTEGER
},
        phase: {
    type: DataTypes.INTEGER,
    references: { model: 'phasename', key: 'id' }
},
        phaseno: {
    type: DataTypes.INTEGER
}
    }, {
        timestamps: false,
        tableName: 'phase'
    });
    phase.associate = function(models) {
        phase.belongsTo(models.phasename, { foreignKey: 'phase', targetKey: 'id' });
    };
    return phase
};