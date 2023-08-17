module.exports = function(sequelize, DataTypes) {
    const phasesubactivity = sequelize.define('phasesubactivity', {
        id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
},
        phase_id: {
    type: DataTypes.INTEGER,
    references: { model: 'phase', key: 'id' }
},
        workout_id: {
    type: DataTypes.INTEGER,
    references: { model: 'workout', key: 'id' }
},
        subworkout_id: {
    type: DataTypes.INTEGER,
    references: { model: 'subworkout', key: 'id' }
}
    }, {
        timestamps: false,
        tableName: 'phasesubactivity'
    });
    phasesubactivity.associate = function(models) {{
        phasesubactivity.belongsTo(models.subworkout, { foreignKey: 'subworkout_id', targetKey: 'id' });
        phasesubactivity.belongsTo(models.phase, { foreignKey: 'phase_id', targetKey: 'id' });
        phasesubactivity.belongsTo(models.workout, { foreignKey: 'workout_id', targetKey: 'id' });
    }};
    return phasesubactivity;
};