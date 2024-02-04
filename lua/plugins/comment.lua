local M = {
  'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
}

function M.config()
  require('Comment').setup({})
end

return M
