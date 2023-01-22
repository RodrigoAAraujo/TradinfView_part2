import { DuplicityError } from "@/errors/DuplicityError";
import { NotfoundError } from "@/errors/NotFoundError";
import { UnauthorizedError } from "@/errors/UnauthorizedError";
import { SigninType, SignupType } from "@/protocols";
import userRepository from "@/repository/user.REPOSITORY";
import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'
import dotenv from 'dotenv'

dotenv.config()

async function validateUserSignIn(user: SigninType){
    const email = await userRepository.checkEmailExistence(user.email)

    if(email.length === 0){
        throw NotfoundError("Email not registered")
    }

    const passCheck = await userRepository.checkPassword(user)

    if (!passCheck){
        throw UnauthorizedError("Email or password incorrect")
    }
}

async function getCredentials(email: string){
    const token = jwt.sign(email, process.env.JWT_SECRET)

    await userRepository.createSession(token, email)

    return token
}



async function createUser(user: SignupType){

    const doubleEmail = await userRepository.checkEmailExistence(user.email)

    if(doubleEmail.length > 0){
        throw DuplicityError("Email already in use")
    }

    const doubleUsername = await userRepository.validateUsernameDuplicity(user.email)

    if(doubleUsername.length > 0){
        throw DuplicityError("Username already in use")
    }

    const encryptedPass = bcrypt.hashSync(user.password, 12)
    user.password = encryptedPass
    await userRepository.insertUser(user)
}

const userServices ={
    validateUserSignIn,
    getCredentials,
    createUser
}

export default userServices