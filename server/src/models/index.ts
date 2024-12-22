import sequelize from '../config/connection.js'
import { Role_typeFactory } from './role_type.js';
import { PersonFactory } from './person.js';
import { UserFactory } from './user.js';

const Role_type = Role_typeFactory(sequelize);
const Person = PersonFactory(sequelize);
const User = UserFactory(sequelize);

export { sequelize, Role_type, Person, User  };
