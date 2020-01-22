const Pool = require('pg').Pool;
const format = require('pg-format');

const config = {
    user: "omkaragrawal", //"process.env.USER",
    database: "users", //"process.env.DB",
    host: "35.244.17.183", //"process.env.HOST",
    port: '5432',
    password: "PGNcMntOIfsbG1pM", //"process.env.PASSWORD",
    ssl: "true"
}
const pgpool = new Pool(config);
module.exports = pgpool;