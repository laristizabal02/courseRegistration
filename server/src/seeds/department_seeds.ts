import { Department } from '../models/index.js';

export const seedsDepartment = async () => {
    await Department.bulkCreate(
      [
        { department_name: 'Math' },
      { department_name: 'Science' },
      { department_name: 'Art' },
      ],
      { individualHooks: true }
    );
  };
  