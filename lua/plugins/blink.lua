return {
  -- No inline grey preview of the selected completion item
  {
    "saghen/blink.cmp",
    opts = {
      completion = { ghost_text = { enabled = false } },
      -- ruby-lsp can't see Rails' concern-injected class methods (validates, etc.),
      -- so pull in friendly-snippets' Rails set; extra ones live in snippets/ruby.json
      sources = {
        providers = {
          snippets = { opts = { extended_filetypes = { ruby = { "rails" } } } },
        },
      },
    },
  },
}
