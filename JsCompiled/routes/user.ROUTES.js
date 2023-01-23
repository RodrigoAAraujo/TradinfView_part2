import { insertUser, sendCredentials } from "../controllers/user.CONTROLLERS.js";
import validateBody from "../middlewares/validateBody.MIDDLE.js";
import { signinSchema, signupSchema } from "../models/user.MODELS.js";
import { Router } from "express";
var userRoutes = Router();
userRoutes.post("/signin", validateBody(signinSchema), sendCredentials);
userRoutes.post("/signup", validateBody(signupSchema), insertUser);
export { userRoutes };
