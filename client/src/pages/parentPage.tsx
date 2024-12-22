import React, { useState, useEffect } from "react";
import { Student } from "../interfaces/Student";
import { Course } from "../interfaces/CourseInt";
import StudentForm from "../components/StudentForm";
import { useNavigate } from "react-router-dom";

const ParentPage: React.FC = () => {
  const [students, setStudents] = useState<Student[]>([]);
  const [courses, setCourses] = useState<Course[]>([]);
  const [action, setAction] = useState<"add" | "delete" | "update" | "register" | "view" | "school" | null>(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      const studentResponse = await fetch("http://localhost:5000/students");
      const courseResponse = await fetch("http://localhost:5000/courses");
      setStudents(await studentResponse.json());
      setCourses(await courseResponse.json());
    };
    fetchData();
  }, []);

  const handleLogout = () => {
    // Clear any authentication-related data (if applicable)
    localStorage.removeItem("authToken");
    navigate("/login");
  };
  const handleAddStudent = async (name: string) => {
    const response = await fetch("http://localhost:5000/students", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name }),
    });
    if (response.ok) {
      const newStudent = await response.json();
      setStudents([...students, newStudent]);
    }
  };

  const handleDeleteStudent = async (id: number) => {
    const response = await fetch(`http://localhost:5000/students/${id}`, {
      method: "DELETE",
    });
    if (response.ok) {
      setStudents(students.filter((student) => student.id !== id));
    }
  };

  const handleUpdateStudent = async (id: number, updatedName: string) => {
    const response = await fetch(`http://localhost:5000/students/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: updatedName }),
    });
    if (response.ok) {
      const updatedStudent = await response.json();
      setStudents(
        students.map((student) => (student.id === id ? updatedStudent : student))
      );
    }
  };

  const handleRegisterStudentToCourse = async (studentId: number, courseId: number) => {
    const response = await fetch(`http://localhost:5000/students/${studentId}/register`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ courseId }),
    });
    if (response.ok) {
      alert("Student registered successfully!");
    }
  };

  const handleViewCourses = async (studentId: number) => {
    const response = await fetch(`http://localhost:5000/students/${studentId}/courses`);
    const studentCourses = await response.json();
    alert(`Courses: ${studentCourses.map((course: Course) => course.name).join(", ")}`);
  };

  return (
    <div>
      <h1>Parent Page</h1>
      <button onClick={handleLogout}>Logout</button>
      <div>
      
      
        <button onClick={() => setAction("add")}>Add Student</button>
        <button onClick={() => setAction("delete")}>Delete Student</button>
        <button onClick={() => setAction("update")}>Update Student</button>
        <button onClick={() => setAction("register")}>Register Student to Course</button>
        <button onClick={() => setAction("view")}>View Courses for Student</button>
        <button onClick={() => setAction("school")}>Check school</button>
      </div>

      {action === "add" && <StudentForm onSubmit={handleAddStudent} />}
      {action === "delete" && (
        <ul>
          {students.map((student) => (
            <li key={student.id}>
              {student.name}
              <button onClick={() => handleDeleteStudent(student.id)}>Delete</button>
            </li>
          ))}
        </ul>
      )}
      {action === "update" && (
        <ul>
          {students.map((student) => (
            <li key={student.id}>
              {student.name}
              <button
                onClick={() =>
                  handleUpdateStudent(student.id, prompt("Enter new name:", student.name) || student.name)
                }
              >
                Update
              </button>
            </li>
          ))}
        </ul>
      )}
      {action === "register" && (
        <ul>
          {students.map((student) => (
            <li key={student.id}>
              {student.name}
              <select
                onChange={(e) =>
                  handleRegisterStudentToCourse(student.id, parseInt(e.target.value, 10))
                }
              >
                <option value="">Select a course</option>
                {courses.map((course) => (
                  <option key={course.id} value={course.id}>
                    {course.name}
                  </option>
                ))}
              </select>
            </li>
          ))}
        </ul>
      )}
      {action === "view" && (
        <ul>
          {students.map((student) => (
            <li key={student.id}>
              {student.name}
              <button onClick={() => handleViewCourses(student.id)}>View Courses</button>
            </li>
          ))}
        </ul>
      )}
      {action === "school" && (
        <ul>
          
          <iframe src="https://storage.googleapis.com/maps-solutions-v0osfmsiix/neighborhood-discovery/halo/neighborhood-discovery.html"
  width="100%" height="100%"
 // style="border:0;"
  loading="lazy">
</iframe>
        </ul>
      )}
    </div>
  );
};

export default ParentPage;

