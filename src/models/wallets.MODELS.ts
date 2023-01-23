import { WalletExchange } from "../protocols/wallets.PROTOCOLS.js";
import Joi from "joi";

export const ExchangeSchema = Joi.object<WalletExchange>({
    amount: Joi.number().required()
})