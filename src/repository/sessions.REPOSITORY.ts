import DBconnection from "../database/db.js"

async function createSession(token: string, email: string){

    try{
        const {id} = (await DBconnection.query(`SELECT id FROM users where email=$1`, [email])).rows[0] as {id: string}

        DBconnection.query(`INSERT INTO sessions (user_id, token) VALUES ($1, $2)`,
        [id, token])
        
    }catch(err){
        throw err
    }
}

async function validateSession(tokenReceiving: string): Promise<boolean>{

    try{
        const {token} = (await DBconnection.query(`SELECT token FROM sessions WHERE token=$1 AND active='TRUE'`,[tokenReceiving])).rows[0] as {token: string}

        if(token){
            return true
        }else{
            return false
        }
    }catch(err){
        throw err
    }
}

async function getUserId(token: string) : Promise<number | null>{

    try{
        const {user_id} = (await DBconnection.query("SELECT user_id FROM sessions WHERE token=$1", [token])).rows[0]

        return user_id
    }catch(err){
        throw err
    }
    
}

const sessionRepository ={
    createSession,
    validateSession,
    getUserId
}

export default sessionRepository