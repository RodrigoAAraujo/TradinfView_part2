import express from 'express';
import cors from 'cors'
import dotenv from 'dotenv'
import { userRoutes } from './routes/user.ROUTES.js';
import { walletRoutes } from './routes/wallet.ROUTES.js';

dotenv.config()

const app = express()

app
    .use(cors())
    .use(express.json())
    .use("/users", userRoutes)
    .use("/wallets", walletRoutes )

const port = process.env.PORT || 4000
    
app.listen(port, () => console.log(`Listening at ${port}`))