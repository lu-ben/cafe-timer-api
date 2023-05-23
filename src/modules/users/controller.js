import db from '../../config/db.js'
import { ERROR } from '../../utils/enum.js'

const getUser = async (request) => {
  try {
    if (Object.keys(request.query).length < 1 || request.query.uid === undefined) {
      return {
        status: 400,
        error: {
          message: ERROR.UID_NF
        }
      }
    }

    const users = await db.client.query(`SELECT * FROM users WHERE id = ${request.query.uid}`)

    return {
      status: 200,
      data: users.rows,
    }
  } catch (err) {
    return {
      status: 500,
      error: err
    }
  }
}

const getUsers = async (_) => {
  try {
    const users = await db.client.query('SELECT * FROM users')

    return {
      status: 200,
      data: users.rows,
    }
  } catch (err) {
    return {
      status: 500,
      error: err
    }
  }
}

export default {
  getUser,
  getUsers,
}