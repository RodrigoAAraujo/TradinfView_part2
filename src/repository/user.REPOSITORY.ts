import DBconnection from "@/database/db";
import { UnauthorizedError } from "@/errors/UnauthorizedError";
import { SigninType, SignupType } from "@/protocols";
import bcrypt from 'bcrypt'

export async function insertUser(user: SignupType){
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

export async function checkPassword(user: SigninType) {
    try{
        const EncryptedPass = await DBconnection.query(`SELECT password FROM users WHERE email=$1`, [user.email])

        const passCheck = bcrypt.compareSync(user.password, EncryptedPass.rows[0])

        return passCheck

    }catch(err){
        throw err
    }
}

export async function checkEmailExistence(email: string){

    try{
        const doubleEmail = await DBconnection.query("SELECT email FROM users WHERE email = $1", [email])
    
        return doubleEmail.rows
    }catch(err){
        throw err
    }
}

export async function validateUsernameDuplicity(username: string){

    try{
        const doubleUsername = await DBconnection.query("SELECT email FROM users WHERE email = $1", [username])
    
        return doubleUsername.rows
    }catch(err){
        throw err
    }
}

export async function createSession(token: string, email: string){

    try{
        const userId = await DBconnection.query(`SELECT id FROM users where email=$1`, [email])

        DBconnection.query(`INSERT INTO session (user_id, token) VALUES ($1, $2)`,
        [token, userId.rows[0]])
        
    }catch(err){
        throw err
    }
   

}

const userRepository = {
    insertUser,
    checkEmailExistence,
    checkPassword,
    createSession,
    validateUsernameDuplicity
}

export default userRepository