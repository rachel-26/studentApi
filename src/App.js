import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [students, setStudents] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [nodeId, setNodeId] = useState('');

  // Fetch node ID on page load
  useEffect(() => {
    axios.get('http://localhost:3000', { withCredentials: false })
      .then(response => {
        setNodeId(response.headers['x-node-id'] || 'Unknown');
      })
      .catch(error => console.error('Error fetching node ID:', error));
  }, []);

  // Fetch students
  const fetchStudents = () => {
    axios.get('http://13.61.183.51:8084/students')
      .then(response => setStudents(response.data))
      .catch(error => console.error('Error fetching students:', error));
    setSubjects([]); // Clear subjects
  };

  // Fetch subjects
  const fetchSubjects = () => {
    axios.get('http://13.61.183.51:8084/subjects')
      .then(response => setSubjects(response.data))
      .catch(error => console.error('Error fetching subjects:', error));
    setStudents([]); // Clear students
  };

  return (
    <div className="App">
      <h1>Student API Front-End</h1>
      <p>Responding Node: {nodeId}</p>
      <button onClick={fetchStudents}>Students</button>
      <button onClick={fetchSubjects}>Courses</button>

      {students.length > 0 && (
        <div>
          <h2>Students</h2>
          <ul>
            {students.map(student => (
              <li key={student.id}>{student.name} - {student.program}</li>
            ))}
          </ul>
        </div>
      )}

      {subjects.length > 0 && (
        <div>
          <h2>Courses (Software Engineering)</h2>
          <ul>
            {subjects.map(subject => (
              <li key={subject.id}>{subject.name} (Year {subject.year})</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

export default App;