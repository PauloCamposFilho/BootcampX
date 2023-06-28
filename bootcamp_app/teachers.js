const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort_param = process.argv[2];
const limit_param = process.argv[3] || 5;

// console.log(cohort_param);
// console.log(limit_param);

const query = `
  SELECT DISTINCT
    teachers.name as teacher
    ,cohorts.name as cohort
  FROM
    assistance_requests
    INNER JOIN teachers on teachers.id = assistance_requests.teacher_id
    INNER JOIN students on students.id = assistance_requests.student_id
    INNER JOIN cohorts on cohorts.id = students.cohort_id
  WHERE
    cohorts.name like $1
  ORDER BY
    teachers.name
  LIMIT $2 ;
`;
const params = [`%${cohort_param}%`, limit_param];

pool.query(query, params)
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.teacher}: ${teacher.cohort}`);
    });
  })
  .catch(err => console.error('query error', err.stack))
  .finally(() => {
    pool.end();
  });
