local M = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}

function M.config()
  require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
  })
  require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
     "lua_ls",
    },
  })
end

return M
