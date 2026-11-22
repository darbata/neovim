return {
  -- Treesitter's Ruby indent queries are unreliable while typing; use Vim's built-in GetRubyIndent()
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { disable = { "ruby" } },
    },
  },
}
