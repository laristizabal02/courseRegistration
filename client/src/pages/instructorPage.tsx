import React, { useState, useEffect } from "react";
import { Course } from "../interfaces/CourseInt";
import CourseForm from "../components/CourseForm";
import { useNavigate } from "react-router-dom";

const InstructorPage: React.FC = () => {
  const [courses, setCourses] = useState<Course[]>([]);
  const [action, setAction] = useState<"add" | "delete" | "update" | null>(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchCourses = async () => {
      const response = await fetch("http://localhost:5000/courses");
      const data = await response.json();
      setCourses(data);
    };
    fetchCourses();
  }, []);

  const handleLogout = () => {
    // Clear any authentication-related data (if applicable)
    localStorage.removeItem("authToken");
    navigate("/login");
  };

  const handleAddCourse = async (name: string, description: string) => {
    const response = await fetch("http://localhost:5000/courses", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name, description }),
    });
    if (response.ok) {
      const newCourse = await response.json();
      setCourses([...courses, newCourse]);
    }
  };

  const handleDeleteCourse = async (id: number) => {
    const response = await fetch(`http://localhost:5000/courses/${id}`, { method: "DELETE" });
    if (response.ok) {
      setCourses(courses.filter((course) => course.id !== id));
    }
  };

  const handleUpdateCourse = async (id: number, updatedName: string, updatedDescription: string) => {
    const response = await fetch(`http://localhost:5000/courses/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: updatedName, description: updatedDescription }),
    });
    if (response.ok) {
      const updatedCourse = await response.json();
      setCourses(courses.map((course) => (course.id === id ? updatedCourse : course)));
    }
  };

  return (
    <div>
      <h1>Instructor Page</h1>
      <button onClick={handleLogout}>Logout</button>
      <div>
        <button onClick={() => setAction("add")}>Add Course</button>
        <button onClick={() => setAction("delete")}>Delete Course</button>
        <button onClick={() => setAction("update")}>Update Course</button>
      </div>

      {action === "add" && <CourseForm onSubmit={handleAddCourse} />}
      {action === "delete" && (
        <ul>
          {courses.map((course) => (
            <li key={course.id}>
              {course.name} - {course.description}
              <button onClick={() => handleDeleteCourse(course.id)}>Delete</button>
            </li>
          ))}
        </ul>
      )}
      {action === "update" && (
        <ul>
          {courses.map((course) => (
            <li key={course.id}>
              {course.name} - {course.description}
              <button
                onClick={() =>
                  handleUpdateCourse(course.id, "Updated Name", "Updated Description")
                }
              >
                Update
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default InstructorPage;