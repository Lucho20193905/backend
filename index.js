const {sequelize, Datatypes, UUID } =  require ("sequelize");

const CADENA_CONEXION = 
    "postgresql://evaluaciones:evaluaciones@localhost:5432/postgres"

    const sequelize = new sequelize(CADENA_CONEXION)

    const usuario = sequelize.define("usuario", {
        id : {
            primaryKey : true,
            type : Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        nombre : {
            type : Datatypes.STRING(200),
            allowNull : false
        },
        apellido: {
            type : Datatypes.STRING(200),
            allowNull : false
        },  
        correo:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        c_postal: {
            type : Datatypes.STRING(200),
            allowNull : false
        },
        telefono: {
            type : Datatypes.INTEGER(200),
            allowNull : false
        },
        ciudad: {
            type :  Datatypes.STRING(200),
            allowNull : false
        }
    }, {
        timestamps : false,
        freezeTableName : true
    })
    const producto = sequelize.define("producto",{
        id : {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        nombre:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        precio: {
            type : Datatypes.INTEGER,
            allowNull : false
        },  
        categoria:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        descripcion: {
            type : Datatypes.STRING(200),
            allowNull : false
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })

    const orden = sequelize.define("orden",{
        id : {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        usuario_id:{
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4,
            allowNull : false
        },
        monto:{
            type : Datatypes.INTEGER,
            allowNull : false
        },
        direccion: {
            type : Datatypes.STRING(200),
            allowNull : false
        },
        fecha: {
            type : Datatypes.STRING(200),
            allowNull : false
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const orden_producto = sequelize.define("orden_producto",{
        id : {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        orden_id : {
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        productos_id : {
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const pcarmado = sequelize.define("pcarmado",{
        id : {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        nombre: {
            type : Datatypes.STRING(200),
            allowNull : false
        },
        descripcion: {
            type : Datatypes.STRING(200),
            allowNull : false
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const pcarmado_productos = sequelize.define("pcarmado_productos",{
        id: {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        pcarmado_id: {
            
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        productos_id: {
            
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const reporte =  sequelize.define("reporte",{
        id: {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        usuario_id: {
            
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        correo:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        nombre:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        telefono:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        asunto:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        descripcion:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
    },
    {
        timestamps : false,
        freezeTableName : true
    })

    const reseña =  sequelize.define("reseña",{
        id: {
            primaryKey: true,
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        usuario_id: {
            
            type: Datatypes.UUID,
            defaultValue : sequelize.UUIDV4
        },
        puntaje:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        comentario:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        video:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        link:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
        tipo_reseña:{
            type : Datatypes.STRING(200),
            allowNull : false
        },
    },
    {
        timestamps : false,
        freezeTableName : true
    })

    //Relaciones

    
