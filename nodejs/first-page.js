
const express = require('express');
const app = express();
const db = require('./queries');


app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept'
  );
  next();
});
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Hello from server');
});

app.post('/register_as_student', db.register_as_student);
app.post('/register_as_teacher', db.register_as_teacher);
app.post('/login_student', db.login_student);
app.post('/login_teacher', db.login_teacher);
app.post('/add_post', db.add_post);
app.post('/update_post', db.update_post);
app.post('/delete_post', db.delete_post);
app.post('/update_students_profile', db.update_students_profile);
app.post('/ update_teachers_profile', db. update_teachers_profile);



app.listen(4200, () => {
  console.log('server is running on port 4200...');
});


