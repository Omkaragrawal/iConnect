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


const dbConfig = {
  user: "omkaragrawal", //"process.env.USER",
  database: "users", //"process.env.DB",
  host: "35.244.17.183", //"process.env.HOST",
  port: '5432',
  password: "omkar.16", //"process.env.PASSWORD",
  ssl: "true"
};

function hash(input, salt) {
  var hashedKey = crypto.pbkdf2Sync(input, salt, 1000, 512, 'sha512');
  return (['pbkdf2sync', '1000', salt, hashedKey.toString('hex')].join('$$#'));
}
const pgpool = new Pool(dbConfig);


/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index');
});

router.get('/userHome', (req, res) => {
  res.send(`This is landing page of the user`)
})

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
router.get('/login', (req,res) =>{
  res.send('SUCCESS');
});



router.get("/success", (req, res) => {
  res.send('SUCCESS');
});

router.get('/HOME', (req, res) => {
  res.render('home');

})

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

router.post('/login', (req,res) =>{
  res.send('SUCCESS');
});

router.post("/signup", [
                                            check('name').notEmpty().isString(),
                                            check("email").notEmpty().isString().isEmail(), 
                                            check("password").notEmpty().withMessage("notEmpty Error")
                                                             .isString().withMessage('isString Error')
                                                             .isLength({min: 7,max: 20}).withMessage('must be at least 7 chars long and at most 20 chars long')
                                                             .matches(/\d/).withMessage('must contain a number')
                                                             .not().isIn(['123', 'password', 'god']).withMessage('Do not use a common word as the password')
                                                    .custom(async (value, { req }) => {
                                                                                            if (value !== req.body.confirmPassword) {
                                                                                              return Promise.reject('Password confirmation is incorrect');
                                                                                            }else{
                                                                                              return true;
                                                                                            }
                                                                                          }),
                                            check('mobile').notEmpty().isMobilePhone("en-IN").withMessage("Invalid Mobile Number"),
                                            ], 
async (req, res, next) => {
  const errors = validationResult(req);
  if(!errors.isEmpty()){
console.log(util.inspect(req.body));
res.status(404).send("NOT FOUND<br>" + util.inspect(req.body) + "<br><br>" + util.inspect(errors));
  } else{
    next();
  }
}, 
async (req, res) => {
  // res.send("Recieved\n" + util.inspect(req.body));
  try{
    const query = `INSERT INTO public.user_details (name, email, password, mobile, organization, "currentYear", "isMentor", "isStudent", "isActive") VALUES ($1,$2,$3,$4,$5, $6, $7, $8, $9);`;
    const data = [req.body.name, req.body.email, req.body.password,req.body.mobile,  req.body.organization, req.body.currentYear, req.body.isMentor, req.body.isStudent, true];
    console.log('at line 111: \t' + query);
    console.log('\nat line 112: \t' + util.inspect(data));
  const response = await pgpool.query(query,data);
  console.log(util.inspect(response));
  // res.send(response);
  res.redirect("/login");

  } catch(error) {
    console.log(util.inspect(error));
    res.send(error);
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





module.exports = router;