import { NotAcceptableError } from "../errors/NotAcceptableError.js"
import DBconnection from "../database/db.js"
import { NotfoundError } from "../errors/NotFoundError.js"
import { wallet } from "@prisma/client"

async function insertWallet(user_id: number) {
    await DBconnection.wallet.create({
        data: {
            user_id
        }
    })
}

async function checkWalletOwner(id: number, token: string): Promise<Boolean> {
    const session = await DBconnection.sessions.findFirst({
        where: {token}
    })

    const wallet = await DBconnection.wallet.findFirst({
        where: {id}
    })


    if (!wallet) {
        throw NotfoundError("Wallet not found")
    }

    if (wallet.user_id === session.user_id) {
        return true
    }
    return false

}

async function deleteWallet(id: number) {

    await DBconnection.wallet.delete({
        where:{id}
    })
}

async function getMyWallets(token: string): Promise<wallet[]> {

    const session = await DBconnection.sessions.findFirst({
        where: {token}
    })

    const wallets = await DBconnection.wallet.findMany({
        where: {user_id: session.user_id}
    })

    return wallets
}

async function adjustBalance(wallet_id: number, amount: number) {

    const wallet = await DBconnection.wallet.findFirst({
        where: {id: wallet_id}
    })
 

    if (Number(wallet.balance) + amount < 0) {
        throw NotAcceptableError("Your balance can`t afford this movimentation")
    }

    await DBconnection.wallet.update({
        where:{id: wallet_id},
        data:{
            balance: Number(wallet.balance) + amount
        }
    })
}

const walletRepository = {
    insertWallet,
    deleteWallet,
    checkWalletOwner,
    adjustBalance,
    getMyWallets
}

export default walletRepository