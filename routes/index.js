"use strict";
const router = require('express').Router();
const Pool = require('pg').Pool;
const format = require('pg-format');
const crypto = require("crypto");
const util = require('util');
const {
  check,
  validationResult,
  sanitizeBody
} = require('express-validator');


// const dbConfig = {
//   user: "omkaragrawal", //"process.env.USER",
//   database: "users", //"process.env.DB",
//   host: "35.244.17.183", //"process.env.HOST",
//   port: '5432',
//   password: "omkar.16", //"process.env.PASSWORD",
//   ssl: "true"
// };

//google-cloud-postgres apsit-a721d
const dbConfig = {
  user: "omkaragrawal", //"process.env.USER",
  database: "iconnect", //"process.env.DB",
  host: "34.93.136.3", //"process.env.HOST",
  port: '5432',
  password: "omkar.16", //"process.env.PASSWORD",
  ssl: "true"
};

//local config  --> UPDATED
// const dbConfig = {
//   user: "omkaragrawal", //"process.env.USER",
//   database: "iconnect_local", //"process.env.DB",
//   host: "127.0.0.1", //"process.env.HOST",
//   port: '5433',
//   password: "omkaragrawal" //"process.env.PASSWORD",
// };

// HEROKU CONFIG ------> UPDATED
// const dbConfig = {
//     user: "wvnybpmuolndkw", //"process.env.USER",
//     database: "de09nbrec575il", //"process.env.DB",
//     host: "ec2-54-235-92-43.compute-1.amazonaws.com", //"process.env.HOST",
//     port: '5432',
//     password: "043f7bea451f8bb8766e4aa2ae4911ced02b93a575425bf52f37e5b4874d25de" //"process.env.PASSWORD",
//   };




function hash(input, salt = (crypto.randomBytes(32)).toString('hex')) {
  var hashedKey = crypto.pbkdf2Sync(input, salt, 1000, 512, 'sha512');
  return (['pbkdf2sync', '1000', salt, hashedKey.toString('hex')].join('$$#'));
}
const pgpool = new Pool(dbConfig);


/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index');
});

router.get('/userHome', (req, res) => {
  res.send(`This is landing page of the user`);
});

// router.get('/login', (req, res) => {
//   res.render('login');
// });

router.get('/register-student', (req, res) => {
  res.render('studentreg');
});

router.get('/logout', function (req, res) {
  delete req.session.auth;
  res.send('Logout successfull');
});
router.get('/login', (req, res) => {
  res.send('SUCCESS');
});



router.get("/success", (req, res) => {
  res.send('SUCCESS');
});

router.get('/HOME', (req, res) => {
  res.render('home');

});

router.get('/interests', async (req, res) => {
  let allInterests;
  try {
    allInterests = await pgpool.query("select * from public.interests;");
  } catch (error) {
    console.log(error);
    res.send(JSON.stringify(error));
  }
  console.log("SUCCESS");
  res.send(allInterests.rows);
});

/* POST home page. */
// router.post("/login", [
//                                             check("email").notEmpty().isString().isEmail(), 
//                                             check("password").notEmpty().withMessage("notEmpty Error")
//                                                             .isString().withMessage('isString Error')
//                                                             .isLength({min: 7,max: 20}).withMessage('must be at least 7 chars long and at most 20 chars long')
//                                                             .matches(/\d/).withMessage('must contain a number')
//                                                             .not().isIn(['123', 'password', 'god']).withMessage('Do not use a common word as the password')
//                                                     .custom(async (value, { req }) => {
//                                                                                             if (value !== req.body.confirmPassword) {
//                                                                                               return Promise.reject('Password confirmation is incorrect');
//                                                                                             }else{
//                                                                                               return true;
//                                                                                             }
//                                                                                           })
//                                             ],
// async (req, res, next) => {
//   const errors = validationResult(req);
//   if(!errors.isEmpty()){
// console.log(util.inspect(req.body));
// res.status(404).send("NOT FOUND<br>" + util.inspect(req.body) + "<br><br>" + util.inspect(errors));
//   } else{
//     next();
//   }
// },                                            
// (req, res) => {
//   console.log(req.body.module);
//   if (req.body.module === 1) {
//     pgpool.query(`Select * from public.users where email = $1 ;`, [req.body.username])
//       .then(data => {
//         if (data.rowCount == 0) {
//           res.statusMessage = "Wrong Credentials";
//           res.status(403).end();
//         } else {
//           var pass = data.rows[0].pass.split('$$');
//           if (hash(req.body.password, pass[2]) === result.rows[0].pass) {
//             req.session.auth = {
//               userid: result.rows[0].login_id
//             };
//             res.json(data.rows[0]);
//           } else {
//             res.statusMessage = "Wrong Credentials";
//             res.status(403).end();
//           }
//           if (err) res.status(403).send(err.toString());
//         }
//       }).catch(err => {
//         res.status(505).send(JSON.stringify(err) || err.toString());
//       });
//   }
// });

// router.post('/login', (req,res) =>{
//   res.send('SUCCESS');
// });

router.post("/signupMentor", [
    check('name').notEmpty().isString(),
    check("email").notEmpty().isString().isEmail(),
    check("password").notEmpty().withMessage("notEmpty Error")
    .isString().withMessage('isString Error')
    .isLength({
      min: 7,
      max: 20
    }).withMessage('must be at least 7 chars long and at most 20 chars long')
    .matches(/\d/).withMessage('must contain a number')
    .not().isIn(['123', 'password', 'god']).withMessage('Do not use a common word as the password')
    .custom(async (value, {
      req
    }) => {
      if (value !== req.body.confirmPassword) {
        return Promise.reject('Password confirmation is incorrect');
      } else {
        return true;
      }
    }),
    check('mobile').notEmpty().isMobilePhone("en-IN").withMessage("Invalid Mobile Number"),
    check('bio').notEmpty().isLength({
      min: 1,
      max: 1000
    }),
    check('linkedin').notEmpty().isURL(),
    check('gender').notEmpty().isLength({
      min: 1,
      max: 1
    }).isLowercase().custom((value, {
      req
    }) => {
      if (['m', 'f', 'o'].indexOf(value) === -1) {
        return Promise.reject('Incorrect Gender');
      } else {
        return true;
      }
    }),
    check('dob').notEmpty().isISO8601(),
    check('org').notEmpty().isLength({
      min: 4,
      max: 100
    })
  ],
  async (req, res, next) => {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log(util.inspect(req.body));
        res.status(404).send("NOT FOUND<br>" + util.inspect(req.body) + "<br><br>" + util.inspect(errors));
      } else {
        next();
      }
    },
    async (req, res) => {
      // res.send("Recieved\n" + util.inspect(req.body));
      try {
        const pass = hash(req.body.password);
        console.log(pass.length);
        if (req.body.isStudent && !req.body.isMentor) {

        } else if (!req.body.isStudent && req.body.isMentor) {

        }
        const query = `INSERT INTO public.mentors(name, gender, dob, email, password, bio, "linkedin", institution, interests, mobile) VALUES ($1,$2,$3,$4,$5, $6, $7, $8, $9, $10);`;
        const data = [req.body.name, req.body.gender, req.body.dob, req.body.email, pass, req.body.bio, req.body.linkedin, req.body.org, JSON.stringify(req.body.interests), req.body.mobile];
        console.log(data.length);
        console.log('at line 111: \t' + query);
        console.log('\nat line 112: \t' + util.inspect(data));
        const response = await pgpool.query(query, data);
        console.log(util.inspect(response));
        // res.send(response);
        res.redirect("/login");

      } catch (error) {
        console.log(util.inspect(error));
        res.send(error);
      }
    });

router.post("/signupStudent", [
    check('name').notEmpty().isString(),
    check("email").notEmpty().isString().isEmail(),
    check("password").notEmpty().withMessage("notEmpty Error")
    .isString().withMessage('isString Error')
    .isLength({
      min: 7,
      max: 20
    }).withMessage('must be at least 7 chars long and at most 20 chars long')
    .matches(/\d/).withMessage('must contain a number')
    .not().isIn(['123', 'password', 'god']).withMessage('Do not use a common word as the password')
    .custom(async (value, {
      req
    }) => {
      if (value !== req.body.confirmPassword) {
        return Promise.reject('Password confirmation is incorrect');
      } else {
        return true;
      }
    }),
    check('mobile').notEmpty().isMobilePhone("en-IN").withMessage("Invalid Mobile Number"),
    check('moodel_id').notEmpty().isNumeric(),
    check('bio').notEmpty().isLength({
      min: 1,
      max: 1000
    }),
    check('gender').notEmpty().isLength({
      min: 1,
      max: 1
    }).isLowercase().custom((value, {
      req
    }) => {
      if (['m', 'f', 'o'].indexOf(value) === -1) {
        return Promise.reject('Incorrect Gender');
      } else {
        return true;
      }
    }),
    check('currentYear').notEmpty().isNumeric()
  ],
  async (req, res, next) => {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log(util.inspect(req.body));
        res.status(404).send("NOT FOUND<br>" + util.inspect(req.body) + "<br><br>" + util.inspect(errors));
      } else {
        next();
      }
    },
    async (req, res) => {
      // res.send("Recieved\n" + util.inspect(req.body));
      try {
        const pass = hash(req.body.password);
        console.log(pass.length);
        const query = `INSERT INTO public.students(name, gender, email, password, moodle_id, bio, interests, mobile) VALUES ($1,$2,$3,$4,$5, $6, $7, $8);`;
        const data = [req.body.name, req.body.gender, req.body.email, pass, req.body.moodel_id, req.body.bio, JSON.stringify(req.body.interests), req.body.mobile];
        console.log(data.length);
        console.log('at line 111: \t' + query);
        console.log('\nat line 112: \t' + util.inspect(data));
        const response = await pgpool.query(query, data);
        console.log(util.inspect(response));
        // res.send(response);

      } catch (error) {
        console.log(util.inspect(error));
        res.send(error);
      }
      res.redirect("/login");
    });


router.post('/login', [
  check("email").notEmpty().isString().isEmail(),
  check("password").notEmpty().withMessage("notEmpty Error")
  .isString().withMessage('isString Error')
  .isLength({
    min: 7,
    max: 20
  }).withMessage('must be at least 7 chars long and at most 20 chars long')
  .matches(/\d/).withMessage('must contain a number')
  .not().isIn(['123', 'password', 'god']).withMessage('Do not use a common word as the password'),
  check('loginType').notEmpty().isLowercase().custom((value, {
    req
  }) => {
    if (['student', 'mentor'].indexOf(value) === -1) {
      return Promise.reject('Incorrect login type');
    } else {
      return true;
    }
  }),
], async (req, res, next) => {
  const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log(util.inspect(req.body));
        res.status(404).send("NOT FOUND<br>" + util.inspect(req.body) + "<br><br>" + util.inspect(errors));
      } else {
        next();
      }
}, async (req, res) => {
  console.log(util.inspect(req.body));
  setTimeout(res.redirect("/dashboard.html"), 2000);
  if (req.body.module === 1) {
    pgpool.query(`Select * from public.users where email = $1 ;`, [req.body.username])
      .then(data => {
        if (data.rowCount == 0) {
          res.statusMessage = "Wrong Credentials";
          res.status(403).end();
        } else {
          var pass = data.rows[0].pass.split('$$');
          if (hash(req.body.password, pass[2]) === result.rows[0].pass) {
            req.session.auth = {
              userid: result.rows[0].login_id
            };
            res.json(data.rows[0]);
          } else {
            res.statusMessage = "Wrong Credentials";
            res.status(403).end();
          }
          if (err) res.status(403).send(err.toString());
        }
      }).catch(err => {
        console.log(util.inspect(err));
        res.status(505).send(JSON.stringify(err) || err.toString());
      });
  }
  if(req.body.loginType === 'student') {
    pgpool.query(`Select * from public.students where email = $1 ;`, [req.body.email])
      .then(data => {
        if (data.rowCount === 0) {
          res.statusMessage = "Wrong Credentials";
          res.status(403).end();
        } else {
          console.log(data.rows[0].password);
          const pass = data.rows[0].password.split('$$');
          if (hash(req.body.password, pass[2]) === data.rows[0].pass) {
            req.session.auth = {
              userid: data.rows[0].id,
            userType: "student"
            };
            res.json(data.rows[0]);
          } else {
            res.statusMessage = "Wrong Credentials";
            res.status(403).end();
          }
          // if (err) res.status(403).send(err.toString());
          console.log("No conditions matched at 388");
        }
      }).catch(err => {
        console.log(util.inspect(err));
        res.status(505).send(JSON.stringify(err) || err.toString());
      });
  } else if (req.body.loginType === 'mentor') {
    pgpool.query(`Select * from public.mentors where email = $1 ;`, [req.body.username])
    .then(data => {
      if (data.rowCount == 0) {
        res.statusMessage = "Wrong Credentials";
        res.status(403).end();
      } else {
        var pass = data.rows[0].password.split('$$');
        if (hash(req.body.password, pass[2]) === data.rows[0].password) {
          req.session.auth = {
            userid: data.rows[0].id,
            userType: "mentor"
          };
          res.json(data.rows[0]);
        } else {
          res.statusMessage = "Wrong Credentials";
          res.status(403).end();
        }
        if (err) res.status(403).send(err.toString());
      }
    }).catch(err => {
      console.log(util.inspect(err));
      res.status(505).send(JSON.stringify(err) || err.toString());
    });
  } else {
    res.send("invalid login Type returned for if");
  }
});

// router.post('/login', function (req, res) {
//   console.log(req.body.module);
//   if (req.body.module === 1) {
//     pgpool.query(`Select * from public.users where email = $1 ;`, [req.body.username])
//       .then(data => {
//         if (data.rowCount == 0) {
//           res.statusMessage = "Wrong Credentials";
//           res.status(403).end();
//         } else {
//           var pass = data.rows[0].pass.split('$$');
//           if (hash(request.body.password, pass[2]) === result.rows[0].pass) {
//             req.session.auth = {
//               userid: result.rows[0].login_id
//             };
//             res.json(data.rows[0]);
//           } else {
//             res.statusMessage = "Wrong Credentials";
//             res.status(403).end();
//           }
//           if (err) res.status(403).send(err.toString());
//         }
//       }).catch(err => {
//         res.status(505).send(JSON.stringify(err) || err.toString());
//       });
//   }
// });

router.post("/searchMentor", (req, res) => {
  console.log(util.inspect(req.body));
  console.log(`Select id, name, bio from public.mentors where lower(name) like lower('%${req.body.searchMentor}%');`)
  pgpool.query(`Select id, name, bio from public.mentors where lower(name) like lower('%${req.body.searchMentor}%');`)
  .then(results => {
    res.send(results.rows);
  })
  .catch(error => {
    res.send(error);
  });
});




module.exports = router;