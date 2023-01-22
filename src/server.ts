import express from 'express';
import cors from 'cors'
import dotenv from 'dotenv'

dotenv.config()

const app = express()

app
    .use(cors())
    .use(express.json())

const port = process.env.PORT || 4000
    
app.listen(port, () => `Listening at ${port}`)