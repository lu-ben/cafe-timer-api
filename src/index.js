import express from 'express'
import dotenv from 'dotenv'
import db from './config/db.js'

import { userSettingsRouter } from './modules/userSettings/routes.js'
import { usersRouter } from './modules/users/routes.js'

dotenv.config();
const app = express();

const startServer = () => {
  app.listen(process.env.API_PORT, () => console.log(`[#] Server started on port ${process.env.API_PORT} [#]`))
  app.use('/user', usersRouter)
  app.use('/userSettings', userSettingsRouter)
}

const main = async () => {
  await db.client.connect()
    .then(startServer)
    .catch((err) => { console.log(`[#] Error connecting to database: ${err} [#]`) });
}

main();