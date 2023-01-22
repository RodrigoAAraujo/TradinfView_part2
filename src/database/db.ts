import pkg from "pg";
import dotenv from "dotenv";
import { ConnectionConfig } from "pg";

dotenv.config()

const {Pool} = pkg

const DBconfig: ConnectionConfig = {
    connectionString: process.env.DB_URL,
}

if(process.env.MODE === "prod"){
    DBconfig.ssl = true
}

const DBconnection = new Pool(DBconfig)

export default DBconnection