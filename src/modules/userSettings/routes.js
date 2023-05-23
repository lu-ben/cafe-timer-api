import express from 'express'
import { expressAdapter } from '../../utils/adapter.js'
import userSettingsController from './controller.js';

export const userSettingsRouter = express.Router();

userSettingsRouter.get('/', expressAdapter(userSettingsController.getUserSetting))