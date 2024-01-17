/* Get the students who's average time it takes to complete an assignment 
is less than the average estimated time it takes to complete an assignment. */
SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as as average_estimated_duration
FROM students JOIN assignment_submissions ON students.id = student_id JOIN assignments ON assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg(assignment_submissions.duration);