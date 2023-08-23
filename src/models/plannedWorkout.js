module.exports=(sequelize,DataTypes)=>{
    const plannedWorkout=sequelize.define("plannedworkout",{
        id:{
            type:DataTypes.INTEGER,
            primaryKey:true,
            autoIncrement:true
        },
        title:{
            type:DataTypes.STRING,
            allowNull:false
        },
        workout_id:{
            type:DataTypes.INTEGER,
            allowNull:false
        },
        sub_workout_id:{
            type:DataTypes.INTEGER,
            allowNull:false
        },
        planned_quota:{
            type:DataTypes.FLOAT,
            allowNull:false
        },
        description:{
            type:DataTypes.STRING,
            allowNull:false
        },

    },{
        timestamps:false,
        tableName:"plannedworkout"
    })
    plannedWorkout.associate = function(models) {{
        plannedWorkout.belongsTo(models.subworkout, { foreignKey: 'sub_workout_id', targetKey: 'id' });
        plannedWorkout.belongsTo(models.workout, { foreignKey: 'workout_id', targetKey: 'id' });
    }};
    return plannedWorkout
}