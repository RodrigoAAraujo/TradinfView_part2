import { adjustWallet, createWallet, deleteWallet, getMywallets } from "../controllers/wallet.CONTROLLERS.js";
import { authValidation } from "../middlewares/authValidation.js";
import { Router } from "express";
import validateBody from "../middlewares/validateBody.MIDDLE.js";
import { ExchangeSchema } from "../models/wallets.MODELS.js";

const walletRoutes = Router()

walletRoutes.get("/me", authValidation, getMywallets)
walletRoutes.post("/add", authValidation, createWallet)
walletRoutes.post("/:wallet_id/exchange", validateBody(ExchangeSchema), authValidation, adjustWallet)
walletRoutes.delete("/:id", authValidation, deleteWallet)

export {walletRoutes} 