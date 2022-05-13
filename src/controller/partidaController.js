import { Router } from 'express';
import {partidaService} from '../service/partidaService.js';

const router = Router();
const partidasService = new partidaService();

router.get('/', async (req, res) => {
    console.log(`This is a get operation`);
    
    const partida = await partidasService.getAllPartidas();
  
    return res.status(200).json(partida);
  });


  router.post('/', async (req, res) => {
    console.log(`This is a post operation`);

    const personaje = await partidasService.createPartida(req.body);

    return res.status(201).json(personaje);
  });




export default router;