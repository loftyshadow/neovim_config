local M = {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons'
}

function M.config()
  vim.keymap.set("n", "<leader>bc", ":BufferLineCloseOthers<cr>")
  require("bufferline").setup({
    options = {
      separator_style = 'slant',
      max_name_length = 12,
      hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
      },
    }
  })
end

return M
