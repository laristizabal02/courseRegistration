import express from 'express';
import sequelize from './config/connection.js';
import routes from './routes/index.js';
import './models'; // Import your models first
import './models/associations.js'; // Import associations after models

const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(routes);

// Force true to drop/recreate table(s) on every sync
sequelize.sync({ force: false }).then(() => {
  app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}`);
  });
});