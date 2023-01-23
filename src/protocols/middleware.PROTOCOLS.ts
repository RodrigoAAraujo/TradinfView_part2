import { NextFunction, Request, Response } from "express"

export type MiddleWareStructure = (req: Request, res : Response, next: NextFunction) => void