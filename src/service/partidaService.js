import sql from 'mssql'
import config from '../../db.js'
import 'dotenv/config'


const partidasTabla= process.env.DB_TABLA_PARTIDAS;

export class partidaService {


    getAllPartidas = async () => {
        const pool = await sql.connect(config);
        console.log('This is a function on the service');
        const response = await pool.request().query(`SELECT * from ${partidasTabla}`);
        console.log(response)

        return response.recordset;
    }

    createPartida = async (partida) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('MounstrosMatados',sql.Int, partida?.MounstrosMatados ?? 0)
            .input('EscenariosCompletados',sql.Int, partida?.EscenariosCompletados ?? 0)
            .input('BossesMatados',sql.Int, partida?.BossesMatados ?? 0)
            .input('MundosCompletados',sql.Int, partida?.MundosCompletados ?? 0)
            .input('ElementosAgarrados',sql.Int, partida?.ElementosAgarrados ?? 0)
            .input('Gano',sql.Bit, partida?.Gano ?? 'false')
            .query(`INSERT INTO ${partidasTabla}(MounstrosMatados, EscenariosCompletados, BossesMatados, MundosCompletados,ElementosAgarrados,Gano) 
            VALUES (@MounstrosMatados, @EscenariosCompletados, @BossesMatados, @MundosCompletados, @ElementosAgarrados,@Gano)`);
        
        console.log(response)

        return response.recordset;
    }

}
