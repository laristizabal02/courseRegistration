import { Form, Button } from 'react-bootstrap';
import { useState, FormEvent, ChangeEvent } from "react";
import { login } from "../api/authAPI";  // Import the login function from the API
import { UserLogin } from "../interfaces/UserLogin";
import Auth from '../utils/auth'; 
//import { Prev } from 'react-bootstrap/esm/PageItem';


const Login: React.FC = () => {
  const [role, setRole] = useState<'instructor' | 'parent' | null>('instructor');
  const [loginData, setLoginData] = useState<UserLogin>({
    username: '',
    password: '',
    role: 'instructor' // Default role
  });

  // Handle input changes for the login form
  const handleChange = (e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setLoginData({
      ...loginData,
      [name]: value
    });
  };

  // Handle role selection
  const handleRoleSelection = (selectedRole: 'instructor' | 'parent') => {
    setRole(selectedRole);
  };

  // Handle form submission
  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();

    // Map the role to corresponding numbers
    const roleNumber = role === 'instructor' ? 1 : 2;

    try {
      // Update loginData with the numerical role value
      const updatedLoginData = {
        ...loginData,
        role: roleNumber.toString() // Convert to string if API expects a string
      };

      console.log(updatedLoginData);

      // Call the login API endpoint with the updated loginData
      const data = await login(updatedLoginData);

      // If login is successful, store the token in localStorage
      Auth.login(data.token);
    } catch (err) {
      console.error('Failed to login', err); // Log any errors during login
    }
  };

  return (
    <div className="card p-4">
      <h2>Select Role</h2>
      <div className="mb-3">
        <Button
          variant="primary"
          className="me-2"
          onClick={() => handleRoleSelection('instructor')}
        >
          Instructor
        </Button>
        <Button
          variant="secondary"
          onClick={() => handleRoleSelection('parent')}
        >
          Parent/Guardian
        </Button>
      </div>

      {role && <h3>Login as {role === 'instructor' ? 'Instructor' : 'Parent/Guardian'}</h3>}

      <Form onSubmit={handleSubmit}>
        <Form.Group className="mb-3" controlId="formUsername">
          <Form.Label>Username</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter username"
            name="username"
            value={loginData.username || ""}
            onChange={handleChange}
          />
        </Form.Group>
        <Form.Group className="mb-3" controlId="formPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control
            type="password"
            placeholder="Password"
            name="password"
            value={loginData.password || ""}
            onChange={handleChange}
          />
        </Form.Group>
        <Button variant="primary" type="submit">
          Login
        </Button>
      </Form>
    </div>
  );
};

export default Login;