const { Sequelize, DataTypes } = require("sequelize");

const CADENA_CONEXION = 
    "postgresql://evaluaciones:evaluaciones@localhost:5432/postgres"

const sequelize = new Sequelize(CADENA_CONEXION)
