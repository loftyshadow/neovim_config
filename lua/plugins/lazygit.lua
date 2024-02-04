local M = {
   "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
}

function M.config()
  vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>')
end

return M
