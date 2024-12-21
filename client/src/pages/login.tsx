import { Form, Button } from 'react-bootstrap';
import { useState, FormEvent, ChangeEvent } from "react";
import { login } from "../api/authApi";  // Import the login function from the API
import { UserLogin } from "../interfaces/UserLogin";
import Auth from '../utils/auth'; 

const Login: React.FC = () => {
  const [role, setRole] = useState<'instructor' | 'parent' | null>(null);
  const [loginData, setLoginData] = useState<UserLogin>({
    username: '',
    password: ''
  });

  const handleChange = (e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setLoginData({
      ...loginData,
      [name]: value
    });
  };

  const handleRoleSelection = (selectedRole: 'instructor' | 'parent') => {
    setRole(selectedRole);
  };

  // Handle form submission for login
  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    try {
      // Call the login API endpoint with loginData
      const data = await login(loginData);
      // If login is successful, call Auth.login to store the token in localStorage
      Auth.login(data.token);
    } catch (err) {
      console.error('Failed to login', err);  // Log any errors that occur during login
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