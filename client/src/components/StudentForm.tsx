import React, { useState } from "react";
import { StudentFormProps } from "../interfaces/StudentFormProps";

const StudentForm: React.FC<StudentFormProps> = ({ onSubmit }) => {
  const [name, setName] = useState("");
  const [courseId, setCourseId] = useState<number | "">("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (name && courseId) {
      onSubmit(name, Number(courseId)); // Ensure courseId is a number
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="name">Student Name:</label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="courseId">Course ID:</label>
        <input
          type="number"
          id="courseId"
          value={courseId}
          onChange={(e) => setCourseId(Number(e.target.value))}
        />
      </div>
      <button type="submit">Submit</button>
    </form>
  );
};

export default StudentForm;