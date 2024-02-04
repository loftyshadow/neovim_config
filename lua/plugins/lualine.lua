local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

function M.config() 
  local lualine = require('lualine')
  lualine.setup({
  })
end

return M

