/* Get the total amount of time that a student has spent on all assignments. */
SELECT SUM(duration) as total_duration
FROM students JOIN assignment_submissions ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';