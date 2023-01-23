import { DuplicityError } from "../errors/DuplicityError.js";
import { NotfoundError } from "../errors/NotFoundError.js";
import { UnauthorizedError } from "../errors/UnauthorizedError.js";
import { SigninType, SignupType } from "../protocols/user.PROTOCOLS.js";
import userRepository from "../repository/user.REPOSITORY.js";
import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'
import dotenv from 'dotenv'
import sessionRepository from "../repository/sessions.REPOSITORY.js";

dotenv.config()

async function validateUserSignIn(user: SigninType) {
    try {

        const email = await userRepository.checkEmailExistence(user.email)

        if (email.length === 0) {
            throw NotfoundError("Email not registered")
        }

        const passCheck = await userRepository.checkPassword(user)


        if (!passCheck) {
            throw UnauthorizedError("Email or password incorrect")
        }

        return true
    } catch (err) {
        throw err
    }

}

async function getCredentials(email: string) {
    try {
        const token = jwt.sign(email, process.env.JWT_SECRET)

        await sessionRepository.createSession(token, email)

        return token
    }catch (err) {
        throw err
    }
    
}

async function createUser(user: SignupType) {
    try{
        const doubleEmail = await userRepository.checkEmailExistence(user.email)

        if (doubleEmail.length > 0) {
            throw DuplicityError("Email already in use")
        }
    
        const doubleUsername = await userRepository.validateUsernameDuplicity(user.username)
    
        if (doubleUsername.length > 0) {
            throw DuplicityError("Username already in use")
        }
    
        const encryptedPass = bcrypt.hashSync(user.password, 12)
        user.password = encryptedPass
        await userRepository.insertUser(user)
    }catch (err) {
        throw err
    }    
}

const userServices = {
    validateUserSignIn,
    getCredentials,
    createUser
}

export default userServices