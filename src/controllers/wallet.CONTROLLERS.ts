import walletRepository from "../repository/wallet.REPOSITORY.js"
import walletServices from "../services/wallet.SERVICES.js"
import { Response, Request } from "express"
import httpStatus from "http-status"

export async function createWallet(req: Request,res: Response){
    const {authorization} = req.headers

    const token = authorization.replace("Bearer ", "")
    try{
        await walletServices.insertWallet(token)

        res.sendStatus(httpStatus.CREATED)
        return
    }catch(err){
        if(err.name === "UnauthorizedError"){
            res.status(httpStatus.CONFLICT).send(err)
            return
        }
        res.send(err)
        return
    }
}

export async function deleteWallet(req: Request, res: Response){
    const {id} = req.params

    const authorization = req.header("Authorization")

    const token = authorization.replace("Bearer ", "")

    try{
        await walletServices.deleteWallet(Number(id), token)

        res.sendStatus(httpStatus.OK)
        return
    }catch(err){
        if(err.name === "NotFoundError"){
            res.status(httpStatus.NOT_FOUND).send(err)
            return
        }
        if(err.name === "UnauthorizedError"){
            res.status(httpStatus.CONFLICT).send(err)
            return
        }
        res.send(err)
        return
    }
}

export async function getMywallets(req: Request, res: Response){
    const authorization = req.header("Authorization")

    const token = authorization.replace("Bearer ", "")

    try{
        const wallets = await walletRepository.getMyWallets(token)

        res.status(httpStatus.OK).send(wallets)
        return
    }catch(err){
        res.send(err)
        return
    }
}

export async function adjustWallet(req: Request, res: Response){
    const {authorization} = req.headers
    const {amount} = req.body as {amount: number}
    const {wallet_id} = req.params

    const token = authorization.replace("Bearer ", "")

    try{
        await walletServices.adjustwalletBalance(Number(wallet_id), Number(amount), token)

        res.sendStatus(httpStatus.OK)
        return
    }catch(err){
        if(err.name === "NotFoundError"){
            res.status(httpStatus.NOT_FOUND).send(err)
            return
        }
        if(err.name === "UnauthorizedError"){
            res.status(httpStatus.CONFLICT).send(err)
            return
        }
        if(err.name === "NotAcceptableError"){
            res.status(httpStatus.NOT_ACCEPTABLE).send(err)
            return
        }
        res.send(err)
        return
    }
}