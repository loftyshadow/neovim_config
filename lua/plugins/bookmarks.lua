local M = {
  'MattesGroeger/vim-bookmarks',
  dependencies = {
  'tom-anders/telescope-vim-bookmarks.nvim',
  },
}

function M.config()

  local telescope = require('telescope')
  telescope.load_extension 'vim_bookmarks'
  local keymap = vim.keymap

  vim.g.bookmark_highlight_lines = 1
  keymap.set(
    'n',
    'ma',
    '<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>'
  )
  keymap.set(
    'n',
    'mc',
    '<cmd>lua require("telescope").extensions.vim_bookmarks.current_file()<cr>'
  )
end

return M
