import pkg from "pg";
import dotenv from "dotenv";
dotenv.config();
var Pool = pkg.Pool;
var DBconfig = {
    connectionString: process.env.DB_URL
};
if (process.env.MODE === "prod") {
    DBconfig.ssl = true;
}
var DBconnection = new Pool(DBconfig);
export default DBconnection;
