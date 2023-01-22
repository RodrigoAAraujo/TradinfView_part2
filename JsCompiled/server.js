import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config();
var app = express();
app
    .use(cors())
    .use(express.json());
var port = process.env.PORT || 4000;
app.listen(port, function () { return "Listening at ".concat(port); });
