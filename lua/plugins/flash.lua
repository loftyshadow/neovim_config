local M = {
	"folke/flash.nvim",
	opts = {},
  -- stylua: ignore
  keys = {
    { "<leader><leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}

function M.config() end

return M
