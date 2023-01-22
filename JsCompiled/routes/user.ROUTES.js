import { insertUser, sendCredentials } from "@/controllers";
import validateBody from "@/middlewares/validateBody.MIDDLE";
import { signinSchema, signupSchema } from "@/models/user.MODELS";
import { Router } from "express";
var userRoutes = Router();
userRoutes.post("/signin", validateBody(signinSchema), sendCredentials);
userRoutes.post("/signup", validateBody(signupSchema), insertUser);
