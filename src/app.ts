import express from 'express';
import * as router from "./routes";

const app = express();

app.use(express.json());

const cors = require('cors');

app.use(cors());

app.use('/player', router.player);
app.use('/single', router.singleMatches);
app.use('/duoMatch', router.duoMatch);
app.use('/duo', router.duoPlayer);
app.use('/start', router.start);

export default app;