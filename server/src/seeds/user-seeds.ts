import { User } from '../models/index.js';

export const seedUsers = async () => {
  await User.bulkCreate(
    [
      { 
        username: 'Dr.Science', 
        email: 'dr.science@school.com', 
        password: 'password' },
      {
        username: 'SuperMom',
        email: 'SuperMom@parents.com',
        password: 'password',
      },
      {
        username: 'SchoolBoy',
        email: 'SchoolBoy@students.com',
        password: 'password',
      },
    ],
    { individualHooks: true }
  );
};
