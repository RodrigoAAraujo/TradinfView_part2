import { NextFunction, Response, Request } from "express";
import { ObjectSchema } from "joi";
import { MiddleWareStructure } from "@/protocols/middleware.PROTOCOLS";

export default function validateBody (schema : ObjectSchema) : MiddleWareStructure{
   return validate(schema) 
}

function validate (schema : ObjectSchema ){
    return (req: Request, res : Response, next: NextFunction) =>{

        const {error} = schema.validate(req.body, {abortEarly: false})

        if (error){
            res.status(400).send({message: error.details.map((o)=> o.message)})
            return
        }else{
            next()
        }
    }
}

