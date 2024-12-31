import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import sequelize from './config/connection.js';
import routes from './routes/index.js';
import cors from 'cors';
import './models/index.js'; // Import your models first
import './models/role_type.js'; // Import your models first
import './models/person.js'; // Import your models first
import './models/user.js'; // Import your models first
import './models/student.js'; // Import your models first
import './models/associations.js'; // Import associations after models
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();

// Define __dirname for ES module
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Initialize the Express app
const app = express();
app.use(express.static(path.join(__dirname, '../client/build')));

// Catch-all handler for serving React app
app.get('*', (_, res) => {//req is not used so typescript flagged it
  res.sendFile(path.join(__dirname, '../client/build', 'index.html'));
});
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:3000',
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use(routes);

// Serve static files from the React build folder
const clientBuildPath = path.join(__dirname, '../../client/build');
app.use(express.static(clientBuildPath));

// Catch-all route to serve React frontend
app.get('*', (_, res) => {
  res.sendFile(path.resolve(clientBuildPath, 'index.html'));
});

// Start the server
sequelize.sync({ force: false })
  .then(() => {
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.error('Error connecting to the database:', err);
  });