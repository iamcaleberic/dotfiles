return {
 "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls" },
    })
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
      on_attach = function(client, bufnr)
        -- Keymaps for LSP actions
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
        -- Add more keymaps as needed
      end,
    })
    vim.lsp.enable('gopls')
    vim.lsp.enable('terraformls')
  end,
}
