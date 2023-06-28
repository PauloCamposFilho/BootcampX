const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort_param = process.argv[2];
const limit_param = Number(process.argv[3]);

pool.query("SELECT students.id, students.name, cohorts.name as cohorts_name FROM students JOIN cohorts on cohorts.id = students.cohort_id WHERE cohorts.name like '%' || $1 || '%' LIMIT $2;", [cohort_param, limit_param])
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohorts_name} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack))
  .finally(() => {
    pool.end();
  });
