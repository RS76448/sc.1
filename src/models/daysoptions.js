// module.exports = {

//     2: [
//         {
//             id: "1 2",
//             value: "[ Monday - Tuesday ]"
//         },
//         {
//             id: "3 5",
//             value: "[Wednesday - Friday ]"
//         }
//     ],
//     3: [
//         {
//             id: "1 2 3",
//             value: "[ Monday - Tuesday- Wednesday ]"
//         },
//         {
//             id: "4 5 6",
//             value: "[ Thursday, Friday, Saturday]"
//         },
//         {
//             id: "1 3 5",
//             value: "[MOnday, Wednesday, Friday]"
//         }
//     ],
//     4: [
//         {
//             id: "1 2 3 4",
//             value: "[ Mon-Tue-Wed, Thurs]"
//         },
//         {
//             id: "2 3 4 5",
//             value: "[ Thuesday, Wed, Thursday, Friday]"
//         }
//     ],
//     5: [
//         {
//             id: "1 2 3 4 5",
//             value: "[ monday, Tuesday, Wed, Thursday, Friday]"
//         }
//     ]
// }

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
          monday: {
            type: DataTypes.STRING(50),
          },
          tuesday: {
            type: DataTypes.STRING(50),
          },
          wednesday: {
            type: DataTypes.STRING(50),
          },
          thursday: {
            type: DataTypes.STRING(50),
          },
          friday: {
            type: DataTypes.STRING(50),
          },
          saturday: {
            type: DataTypes.STRING(50),
          },
          sunday: {
            type: DataTypes.STRING(50),
          },
          dayscode: {
            type: DataTypes.STRING(50),
          },
          activities:{
            type: DataTypes.STRING(50)
          }
        }, {
          timestamps: false,
        });
};





