import express from "express";
import cors from "cors";
import JuegoRuta from "./src/controller/partidaController.js";
import passport from 'passport';
import {jwtStrategy} from './src/common/jwt.strategy.js';
import LoginRuta from "./src/controller/loginController.js";
import JugadorRuta from "./src/controller/jugadorController.js";


const app=express();
const port=5000;

app.use(cors());
app.use(express.json());
passport.use(jwtStrategy);
app.use(passport.initialize());

app.use('/Jugador',JugadorRuta);
app.use('/Juego',JuegoRuta);
app.use('/login',LoginRuta);

app.listen(port,()=>{

console.log(`Listen on port ${port}`);

})