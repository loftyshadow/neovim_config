local M = {
  'akinsho/toggleterm.nvim', 
}

function M.config()
  local toggleterm = require('toggleterm')
  toggleterm.setup {
    open_mapping = [[<c-/>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = 130,
      height = 30,
    },
  }
end

return M
