import React from "react";
import { useNavigate } from "react-router-dom";

const InstructorPage: React.FC = () => {
  const navigate = useNavigate();

  return (
    <div>
      <h1>You are on the Instructor Page</h1>
      <button onClick={() => navigate('/login')}>Go Back</button>
    </div>
  );
};

export default InstructorPage;