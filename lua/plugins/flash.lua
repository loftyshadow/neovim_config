local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader><leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}

function M.config()
end

return M
