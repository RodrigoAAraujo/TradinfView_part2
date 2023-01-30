import DBconnection from "../database/db.js";
import { SigninType, SignupType } from "../protocols/user.PROTOCOLS.js";
import bcrypt from 'bcrypt'
import { users } from "@prisma/client";

async function insertUser(user: SignupType) {
    await DBconnection.users.create({
        data: user
    })

}

async function checkPassword(user: SigninType): Promise<Boolean> {

    const session = await DBconnection.users.findFirst({
        where: {
            email: user.email
        }
    })

    const passCheck = bcrypt.compareSync(user.password, session.password)

    return passCheck

}

async function checkEmailExistence(email: string): Promise<users[]> {
    const doubleEmail = await DBconnection.users.findMany({
        where:{
            email
        }
    })

    return doubleEmail
}

async function validateUsernameDuplicity(username: string): Promise<users[]> {
    const doubleUsername = await DBconnection.users.findMany({
        where:{
            username
        }
    })

    return doubleUsername
}

const userRepository = {
    insertUser,
    checkEmailExistence,
    checkPassword,
    validateUsernameDuplicity
}

export default userRepository