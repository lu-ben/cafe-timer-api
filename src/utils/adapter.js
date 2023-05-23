export const expressAdapter = (handler) => async (req, res) => {
  const result = await handler(req)

  let response = result.error !== undefined ? result.error.message : result.data
  res.status(result.status).json(response)
};
