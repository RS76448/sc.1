module.exports = function (sequelize, DataTypes) {
    const rulesforage = sequelize.define('rulesforage', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        minage: {
            type: DataTypes.INTEGER
        },
        maxage: {
            type: DataTypes.INTEGER
        },
        changepercentage: {
            type: DataTypes.FLOAT
        },
    }, {
        timestamps: false,
        tableName: 'rulesforage'
    });
    rulesforage.associate = function (models) {

    };
    return rulesforage
};