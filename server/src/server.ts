import express from 'express';
import path from 'path';
import sequelize from './config/connection.js';
import routes from './routes/index.js';

import cors from 'cors';
import './models/index.js'; // Import your models first
import './models/role_type.js'; // Import your models first
import './models/person.js'; // Import your models first
import './models/user.js'; // Import your models first
import './models/student.js'; // Import your models first
import './models/associations.js'; // Import associations after models
const app = express();

// Serve static files from the client/build directory
const __dirname = path.resolve();
app.use(express.static(path.join(__dirname, '../client/build')));

// Catch-all handler for serving React app
app.get('*', (_, res) => {//req is not used so typescript flagged it
  res.sendFile(path.join(__dirname, '../client/build', 'index.html'));
});

const PORT = process.env.PORT || 3001;
app.use(cors({
  origin: 'http://localhost:3000'
 }));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(routes);

// Force true to drop/recreate table(s) on every sync
sequelize.sync({ force: false }).then(() => {
  app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}`);
  });
});