import React, { useState } from 'react';
import { Form, Button } from 'react-bootstrap';

const Login: React.FC = () => {
  const [role, setRole] = useState<'instructor' | 'parent' | null>(null);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleRoleSelection = (selectedRole: 'instructor' | 'parent') => {
    setRole(selectedRole);
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

      <Form>
        <Form.Group className="mb-3" controlId="formUsername">
          <Form.Label>Username</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter username"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </Form.Group>
        <Form.Group className="mb-3" controlId="formPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </Form.Group>
        <Button variant="success">Login</Button>
      </Form>
    </div>
  );
};

export default Login;