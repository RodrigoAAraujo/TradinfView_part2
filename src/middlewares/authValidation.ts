import sessionRepository from "../repository/sessions.REPOSITORY.js";
import { NextFunction, Request, Response } from "express";
import httpStatus from "http-status";

export async function authValidation( req: Request, res: Response, next: NextFunction){
    const {authorization}  = req.headers

    if(!authorization){
        res.status(httpStatus.BAD_REQUEST).send("No authorization header")
        return
    }

    if(!authorization.includes("Bearer ")){
        res.status(httpStatus.BAD_REQUEST).send("Header authorization in wrong format")
        return
    }

    const token = authorization.replace("Bearer ", "")

    try{
        const valid = await sessionRepository.validateSession(token)

        if(!valid){
            res.status(httpStatus.UNAUTHORIZED).send("Wrong credentials")
            return
        }

        next()

    }catch(err){
        res.send(err)
        return
    }

}

