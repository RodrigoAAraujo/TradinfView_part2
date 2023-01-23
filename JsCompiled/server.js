import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { userRoutes } from './routes/user.ROUTES.js';
import { walletRoutes } from './routes/wallet.ROUTES.js';
dotenv.config();
var app = express();
app
    .use(cors())
    .use(express.json())
    .use("/users", userRoutes)
    .use("/wallets", walletRoutes);
var port = process.env.PORT || 4000;
app.listen(port, function () { return console.log("Listening at ".concat(port)); });
