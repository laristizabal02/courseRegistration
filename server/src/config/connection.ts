import dotenv from 'dotenv';
dotenv.config();
import { Sequelize } from 'sequelize';
console.log('DB_NAME:', process.env.DB_NAME);
console.log('DB_USER:', process.env.DB_USER);
console.log('DB_PW:', process.env.DB_PASSWORD);

let sequelize: Sequelize;

if (process.env.DB_URL) {
  // Create a new Sequelize instance using the connection URL
  sequelize = new Sequelize(process.env.DB_URL, {
    dialect: 'postgres',
  });
} else {
  sequelize = new Sequelize(
    process.env.DB_NAME!,
    process.env.DB_USER!,
    process.env.DB_PASSWORD!,
    {
      host: 'localhost',
      dialect: 'postgres',
    },
  );
}

export default sequelize;

/* const sequelize = process.env.DB_URL
  ? new Sequelize(process.env.DB_URL)
  : new Sequelize(
      process.env.DB_NAME || '',
      process.env.DB_USER || '',
      process.env.DB_PASSWORD,
      {
        host: 'localhost',
        dialect: 'postgres',
        dialectOptions: {
          decimalNumbers: true,
        },
      }
    ); */

