const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM cohorts 
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
  JOIN teachers ON teachers.id = teacher_id 
  WHERE cohorts.name LIKE $1
  ORDER BY teachers.name;
  `;

const cohortName = process.argv[2];
const values = [`%${process.argv[2]}%`]
pool.query(queryString, values)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
});