import sql from 'mssql'
import config from '../../db.js'
import 'dotenv/config'


const jugadorTabla= process.env.DB_TABLA_JUGADOR;

export class jugadorService {

    getAllJugadores = async () => {
        const pool = await sql.connect(config);
        console.log('This is a function on the service');
        const response = await pool.request().query(`SELECT * from ${jugadorTabla}`);
        console.log(response)

        return response.recordset;
    }

    createJugador = async (Jugador) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Nombre',sql.NChar, Jugador?.Nombre ?? '')
            .input('Email',sql.NChar, Jugador?.Email ?? '')
            .input('Edad',sql.Int, Jugador?.Edad ?? 0)
            .query(`INSERT INTO ${jugadorTabla}(Nombre, Email, Edad) 
            VALUES (@Nombre, @Email, @Edad)`);
        
        console.log(response)

        return response.recordset;
    }


    getJugadorById = async (Id) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Id',sql.Int, Id)
            .query(`SELECT * from ${jugadorTabla} where id = @id`);
        console.log(response)

        return response.recordset[0];
    }
    updateJugadorById = async (Id,Jugador) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Id',sql.Int, Id ?? 0)
            .input('Nombre',sql.NChar, Jugador?.Nombre ?? '')
            .input('Email',sql.NChar, Jugador?.Email ?? '')
            .input('Edad',sql.Int, Jugador?.Edad ?? 0)
            .query(`UPDATE ${jugadorTabla} SET Nombre = @Nombre,
            Email = @Email, Edad = @Edad WHERE Id = @Id`);
        console.log(response)

        return response.recordset;
    }

    deleteJugadorById = async (Id) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Id',sql.Int, Id)
            .query(`DELETE FROM ${jugadorTabla} WHERE Id = @Id`);
        console.log(response)

        return response.recordset;
    }



}