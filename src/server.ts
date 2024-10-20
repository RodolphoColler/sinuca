import app from './app';

const server = app.listen(3000, () => console.log(`Online on ${3000}`));

export default server;
