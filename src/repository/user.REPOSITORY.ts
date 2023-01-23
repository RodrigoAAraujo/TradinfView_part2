import DBconnection from "../database/db.js";
import { SigninType, SignupType } from "../protocols/user.PROTOCOLS.js";
import bcrypt from 'bcrypt'

async function insertUser(user: SignupType){
    try{

        if(user.image_url === null){
            DBconnection.query("INSERT INTO users (username, email, password, image_url) VALUES ($1, $2, $3)", 
            [user.username, user.email, user.password])
        }
    
        
        DBconnection.query("INSERT INTO users (username, email, password, image_url) VALUES ($1, $2, $3, $4)",
        [user.username, user.email, user.password, user.image_url])

    }catch(err){
        throw err
    }
}

async function checkPassword(user: SigninType) : Promise<Boolean> {
    try{
        const {password} = (await DBconnection.query(`SELECT password FROM users WHERE email=$1`, [user.email])).rows[0]  as {password: string}

        const passCheck = bcrypt.compareSync(user.password, password)

        return passCheck

    }catch(err){
        throw err
    }
}

async function checkEmailExistence(email: string) : Promise<string[]>{

    try{
        const doubleEmail = await DBconnection.query("SELECT email FROM users WHERE email = $1", [email])
    
        return doubleEmail.rows
    }catch(err){
        throw err
    }
}

async function validateUsernameDuplicity(username: string) : Promise<string[]>{

    try{
        const doubleUsername = await DBconnection.query("SELECT email FROM users WHERE username = $1", [username])
    
        return doubleUsername.rows
    }catch(err){
        throw err
    }
}

const userRepository = {
    insertUser,
    checkEmailExistence,
    checkPassword,
    validateUsernameDuplicity
}

export default userRepository