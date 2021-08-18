
const pgp = require('pg-promise')();
const db = pgp({
    user: 'postgres',
    host: 'localhost',
    database: 'postgres',
    password: '95463104',
    port: 5432,
});
//connection test --------------------------------------------------------------

db.one('INSERT INTO main.student(fname, susername) VALUES($1, $2) RETURNING fname', ['John', 'true'])
    .then(data => {
        console.log(data.fname); // print new user id;
    })
    .catch(error => {
        console.log('ERROR:', error); // print error;
    });
//-----------------------------------------------------------------------------

//register as student---------------------------------------------------------------
const register_as_student = (req, res) => {
  db.func('main.register_as_student', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};

//register as teacher---------------------------------------------------------------
const register_as_teacher = (req, res) => {
  db.func('main.register_as_teacher', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};

//login as student---------------------------------------------------------------
const login_student = (req, res) => {
  db.func('main.login_student', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};

//login as teacher---------------------------------------------------------------
const login_teacher = (req, res) => {
  db.func('main.login_teacher', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};
//add post---------------------------------------------------------------
const add_post = (req, res) => {
  db.func('main.add_post', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};


//delete post---------------------------------------------------------------
const delete_post = (req, res) => {
  db.func('main.delete_post', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};
//update post---------------------------------------------------------------
const update_post = (req, res) => {
  db.func('main.update_post', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};
//update_students_profile---------------------------------------------------------------
const update_students_profile = (req, res) => {
  db.func('main.update_students_profile', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};

//update_teachers_profile---------------------------------------------------------------
const update_teachers_profile = (req, res) => {
  db.func('main.update_teachers_profile', [JSON.stringify(req.body)])
    .then((rows) => {
      console.log(rows);
      res.json(rows);
      console.log(JSON.stringify(req.body))
    })
    .catch((err) => {
      console.log(err);
    });
};



module.exports = {
  register_as_student,
  register_as_teacher,
  login_teacher,
  login_student,
  add_post,
  delete_post,
  update_post,
  update_students_profile,
  update_teachers_profile
};
