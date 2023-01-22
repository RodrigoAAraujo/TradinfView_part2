import { SigninType, SignupType } from "@/protocols";
import Joi from "joi";

export const signinSchema = Joi.object<SigninType>({
    email: Joi.string().min(3).required(),
    password: Joi.string().min(8).required()
})

export const signupSchema = Joi.object<SignupType>({
    username: Joi.string().min(3).required(),
    email: Joi.string().min(3).required(),
    password: Joi.string().min(8).required(),
    image_url: Joi.string().uri()
})