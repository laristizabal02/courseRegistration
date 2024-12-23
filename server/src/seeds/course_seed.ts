import { Course } from '../models/index.js';

export const seedsCourse = async () => {
    await Course.bulkCreate(
      [
        { 
            title: 'Math' , 
            department_id: 1,
        },
        { 
            title: 'Algebra' , 
            department_id: 1,
        },
        { 
            title: 'Trigonometry' , 
            department_id: 1,
        },
        { 
            title: 'Chemistry' , 
            department_id: 2,
        },
        { 
            title: 'Geography' , 
            department_id: 2,
        },
        { 
            title: 'Biology' , 
            department_id: 2,
        },
        { 
            title: 'Painting' , 
            department_id: 3,
        },
        { 
            title: 'Math' , 
            department_id: 3,
        },
        { 
            title: 'Math' , 
            department_id: 3,
        },
      ],
      { individualHooks: true }
    );
  };
  