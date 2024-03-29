/* Get currently enrolled students' average assignment completion time. */
SELECT students.name as student, AVG(duration) as average_assignment_duration
FROM students JOIN assignment_submissions ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY AVG(duration) DESC;