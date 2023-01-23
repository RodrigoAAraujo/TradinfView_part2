## About 

This API works in a slight glance with marketing and finances. Trying to emulate a day-to-day marketing wallets


## Routes

USERS 

    POST("signin")
        body --> models.user.Signin
        
    POST("signup")
        body --> models.user.Signup

WALLET

    GET("me")

    POST("add")

    DELETE(":id")

    POST(":id/exchange")
        body --> models.wallet.exchangeSchema


## Getting it to Deploy

1. install all dependencies with --npm run build 

2. initialization with command -- npm start

3. For enviroment variables, follow the `.env.example.deploy`


## Getting it to Local

1. install all dependencies with --npm run build 

2. Create a database in which you will storage the data

3. initialization for development with command -- npm run dev 

4. Initialization command -- npm start

For enviroment variables, follow the `.env.example.local`


## Whats done

1. Is capable of registering users 

2. Is capable of registering wallets of investments

3. Is capable to simulate losses and gains in those wallets


## Whats is still to be done

1. A clear categorization of investments that will lead to the use of the wallets
