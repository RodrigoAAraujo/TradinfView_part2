import { NotAcceptableError } from "../errors/NotAcceptableError.js"
import DBconnection from "../database/db.js"
import { NotfoundError } from "../errors/NotFoundError.js"

async function insertWallet(user_id: number){
    try{
        DBconnection.query("INSERT INTO wallet (user_id) VALUES ($1)", [user_id])
    }catch(err){
        throw err
    }
 
}

async function checkWalletOwner(id: number, token: string): Promise<Boolean>{
    try{
        const session = (await DBconnection.query("SELECT user_id FROM sessions WHERE token=$1", [token])).rows[0] as {user_id: number}

        const wallet = (await DBconnection.query("SELECT user_id FROM wallet WHERE id=$1", [id])).rows[0] as {user_id: number | null}

        if(wallet === undefined){
            throw NotfoundError("Wallet not found")
        }

        if(wallet.user_id === session.user_id){
            return true
        }
        return false

    }catch(err){
        throw err
    }
}

async function deleteWallet(id:number){
    try{
        DBconnection.query("DELETE FROM wallet WHERE id=$1", [id])
    }catch(err){
        throw err
    }
 
}

async function getMyWallets(token: string): Promise<{balance: number}[]>{

    const {user_id} = (await DBconnection.query("SELECT user_id FROM sessions WHERE token=$1", [token])).rows[0] as {user_id: number | null}

    const wallets = (await DBconnection.query("SELECT balance FROM wallet WHERE user_id=$1", [user_id])).rows

    return wallets
}

async function adjustBalance(wallet_id: number, amount: number){

    const {balance} = (await DBconnection.query("SELECT balance FROM wallet WHERE id=$1", [wallet_id])).rows[0] as {balance: number}

    if(Number(balance) + amount < 0){
        throw NotAcceptableError("Your balance can`t afford this movimentation")
    }

    DBconnection.query(`UPDATE wallet SET balance=$1 WHERE id=$2`, [Number(balance)+amount, wallet_id])

}

const walletRepository = {
    insertWallet,
    deleteWallet,
    checkWalletOwner,
    adjustBalance,
    getMyWallets
}

export default walletRepository