import { NextFunction, Response, Request } from "express";
import httpStatus from "http-status";
import { ObjectSchema } from "joi";

export default function validateBody (schema : ObjectSchema) : MiddleWareStructure{
   return validate(schema) 
}

function validate (schema : ObjectSchema ){
    return (req: Request, res : Response, next: NextFunction) =>{
        const {error} = schema.validate({abortEarly: false})

        if (error){
            res.sendStatus(httpStatus.BAD_REQUEST).send({message: error.details.map(o => o.message)})
        }
        next()
    }
}

type MiddleWareStructure = (req: Request, res : Response, next: NextFunction) => void