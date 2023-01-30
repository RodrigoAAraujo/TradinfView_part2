import DBconnection from "../database/db.js"

async function createSession(token: string, email: string) {

    const user = await DBconnection.users.findFirst({
        where: {
            email
        }
    })

    DBconnection.sessions.create({
        data: {
            user_id: user.id,
            token
        }
    })
}

async function validateSession(tokenReceiving: string): Promise<boolean> {
    const session = await DBconnection.sessions.findFirst({
        where: {
            token: tokenReceiving,
            active: true
        }
    })

    if (session) {
        return true
    } else {
        return false
    }
}

async function getUserId(token: string): Promise<number | null> {
    const user = await DBconnection.sessions.findFirst({
        where: {
            token
        }
    })
    return user.user_id
}

const sessionRepository = {
    createSession,
    validateSession,
    getUserId
}

export default sessionRepository