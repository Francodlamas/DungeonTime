import { Router } from 'express';
import {partidaService} from '../service/partidaService.js';
import { Authenticate } from '../common/jwt.strategy.js';

const router = Router();
const partidasService = new partidaService();

router.get('/',Authenticate, async (req, res) => {
    console.log(`This is a get operation`);
    
    const partida = await partidasService.getAllPartidas();
  
    return res.status(200).json(partida);
  });

  router.post('/',Authenticate, async (req, res) => {
    console.log(`This is a post operation`);

    const personaje = await partidasService.createPartida(req.body);

    return res.status(201).json(personaje);
  });

  router.get('/:id',Authenticate, async (req, res) => {
    const id = req.params.id;
    console.log(`Request URL Param: ${id}`);
    console.log(`This is a get operation`);
  
    const partida = await partidasService.getPartidaById(id);
  
    return res.status(200).json(partida);
  });
  router.get('/idJugador/:idJugador',Authenticate, async (req, res) => {
    const idJugador = req.params.idJugador;
    console.log(`Request URL Param: ${idJugador}`);
    console.log(`This is a get operation`);
  
    const partida = await partidasService.getPartidaByIdJugador(idJugador);
  
    return res.status(200).json(partida);
  });

  router.put('/:id',Authenticate, async (req, res) => {
    console.log(`Request URL Param: ${req.params.id}`);
    console.log(`This is a put operation`);
    const id = req.params.id;
    const partida = await partidasService.updatePartidaById(id,req.body);
    
    return res.status(200).json(partida);
  });
  
  router.delete('/:id',Authenticate, async (req, res) => {
    console.log(`Request URL Param: ${req.params.id}`);
    console.log(`This is a delete operation`);
    
    const partida = await partidasService.deletePartidaById(req.params.id);
    
    return res.status(200).json(partida);
  });

export default router;