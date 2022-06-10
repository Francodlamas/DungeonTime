import { Router } from 'express';
import {jugadorService} from '../service/jugadorService.js';
import { Authenticate } from '../common/jwt.strategy.js';

const router = Router();
const jugadoresService = new jugadorService();

router.get('/',Authenticate, async (req, res) => {
    console.log(`This is a get operation`);
    
    const Jugador = await jugadoresService.getAllJugadores();
  
    return res.status(200).json(Jugador);
  });

  router.post('/',Authenticate, async (req, res) => {
    console.log(`This is a post operation`);

    const Jugador = await jugadoresService.createJugador(req.body);

    return res.status(201).json(Jugador);
  });

  router.get('/:id',Authenticate, async (req, res) => {
    const id = req.params.id;
    console.log(`Request URL Param: ${id}`);
    console.log(`This is a get operation`);
  
    const Jugador = await jugadoresService.getJugadorById(id);
  
    return res.status(200).json(Jugador);
  });

  router.put('/:id',Authenticate, async (req, res) => {
    console.log(`Request URL Param: ${req.params.id}`);
    console.log(`This is a put operation`);
    const id = req.params.id;
    
    const Jugador = await jugadoresService.updateJugadorById(id,req.body);
    
    return res.status(200).json(Jugador);
  });
  
  router.delete('/:id',Authenticate, async (req, res) => {
    console.log(`Request URL Param: ${req.params.id}`);
    console.log(`This is a delete operation`);
    
    const Jugador = await jugadoresService.deleteJugadorById(req.params.id);
    
    return res.status(200).json(Jugador);
  });

export default router;