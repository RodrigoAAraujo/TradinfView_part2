import { UnauthorizedError } from "../errors/UnauthorizedError.js"
import sessionRepository from "../repository/sessions.REPOSITORY.js"
import walletRepository from "../repository/wallet.REPOSITORY.js"

async function deleteWallet(id: number, token: string){
    try {

        const validOwner = await walletRepository.checkWalletOwner(id, token)

        if(!validOwner){
            throw UnauthorizedError("Wallet is not from this owner")
        }

        await walletRepository.deleteWallet(id)
    } catch (err) {
        throw err
    }

}

async function insertWallet(token: string){
    try {
        const user_id = await sessionRepository.getUserId(token)

        if(user_id === null){
            throw UnauthorizedError("Token Invalid")
        }

        await walletRepository.insertWallet(user_id)
    } catch (err) {
        throw err
    }
}

async function adjustwalletBalance(wallet_id: number, amount: number, token: string){
    try {
        const validOwner = await walletRepository.checkWalletOwner(wallet_id, token)

        if(!validOwner){
            throw UnauthorizedError("Wallet is not from this owner")
        }

        await walletRepository.adjustBalance(wallet_id, amount)

    } catch (err) {
        throw err
    }
}

const walletServices = {
    deleteWallet, insertWallet, adjustwalletBalance
}

export default walletServices