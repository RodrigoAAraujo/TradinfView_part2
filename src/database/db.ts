import dotenv from "dotenv";
import { PrismaClient } from "@prisma/client";

dotenv.config()

const DBConnection = new PrismaClient()

export default DBConnection