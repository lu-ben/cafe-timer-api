import express from 'express'
import { expressAdapter } from '../../utils/adapter.js'
import userController from './controller.js';

export const usersRouter = express.Router();

usersRouter.get('/', expressAdapter(userController.getUser))
usersRouter.get('/all', expressAdapter(userController.getUsers))
