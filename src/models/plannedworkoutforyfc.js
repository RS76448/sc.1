module.exports=(sequelize,DataTypes)=>{
    const plannedWorkout=sequelize.define("plannedworkoutforyfc",{
        id:{
            type:DataTypes.INTEGER,
            primaryKey:true,
            autoIncrement:true
        },
        title:{
            type:DataTypes.STRING,
            allowNull:false
        },
        workout:{
            type:DataTypes.STRING,
            allowNull:false
        },
        sub_workout_id:{
            type:DataTypes.INTEGER,
            allowNull:false
        },
      
        description:{
            type:DataTypes.STRING,
            allowNull:false
        },

    },{
        timestamps:false,
        tableName:"plannedworkoutforyfc"
    })
    plannedWorkout.associate = function(models) {{
        plannedWorkout.belongsTo(models.subworkout, { foreignKey: 'sub_workout_id', targetKey: 'id' });
        
    }};
    return plannedWorkout
}