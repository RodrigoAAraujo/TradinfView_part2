import Joi from "joi";
export var ExchangeSchema = Joi.object({
    amount: Joi.number().required()
});
