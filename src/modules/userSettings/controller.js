const getUserSetting = async (request) => {
  try {
    const userSettings = await db.client.query('SELECT * from userSettings')
    return {
      status: 200,
      data: userSettings.rows,
    }
  } catch (err) {
    return {
      status: 500,
      error: err
    }
  }
}

export default {
  getUserSetting
}