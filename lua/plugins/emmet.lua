return {
  -- Emmet abbreviations (div.card>ul>li*3) in the completion menu
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = { "html", "eruby", "vue", "css", "scss", "javascriptreact", "typescriptreact" },
        },
      },
    },
  },
}
