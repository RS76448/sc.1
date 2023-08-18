module.exports = function(sequelize, DataTypes) {
    return sequelize.define('workout_schedule', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        week: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        date: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        day: {
            type: DataTypes.STRING(10),
            allowNull: false,
        },
        total_quota_for_week: {
            type: DataTypes.STRING(10),
            allowNull: false,
        },
        day_quota: {
            type: DataTypes.STRING(10),
            allowNull: false,
        },
        phase: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        workout: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
        sub_workout: {
            type: DataTypes.STRING(50),
            allowNull: false,
        },
    }, {
        timestamps: false,
        tablename:"workout_schedule"
    });
};
