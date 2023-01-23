import Joi from "joi";
export var signinSchema = Joi.object({
    email: Joi.string().min(3).required(),
    password: Joi.string().min(8).required()
});
export var signupSchema = Joi.object({
    username: Joi.string().min(3).required(),
    email: Joi.string().email().min(3).required(),
    password: Joi.string().min(8).required(),
    image_url: Joi.string().uri()
});
