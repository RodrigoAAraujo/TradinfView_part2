import userServices from "@/services/user.SERVICES";
import { Request, Response } from "express";
import httpStatus from "http-status";

export async function sendCredentials(req: Request, res: Response){
    const user = req.body

    try{
        await userServices.validateUserSignIn(user)

        const credentials = await userServices.getCredentials(user.email)

        res.sendStatus(httpStatus.OK).send({
            token: credentials
        })
        return

    }catch(err){
        if(err.name === "NotFoundError"){
            res.sendStatus(httpStatus.NOT_FOUND).send(err)
            return
        }
        if(err.name === "UnauthorizedError"){
            res.sendStatus(httpStatus.CONFLICT).send(err)
            return
        }
        res.send(err)
        return
    }

}

export async function insertUser(req: Request, res: Response){    
    const user = req.body

    try{
        await userServices.createUser(user)

        res.sendStatus(httpStatus.CREATED)
        return

    }catch(err){
        if(err.name === "DuplicityError"){
            res.sendStatus(httpStatus.CONFLICT).send(err)
            return
        }
        res.send(err)
        return
    }
}