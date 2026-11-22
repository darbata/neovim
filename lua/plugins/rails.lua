return {
  -- Rails navigation: :A (alternate file), :R (related), gf on partials, :Emodel, :Econtroller, etc.
  { "tpope/vim-rails", ft = { "ruby", "eruby" } },

  -- Auto-insert `end` after def/do/if/class
  { "tpope/vim-endwise", event = "InsertEnter" },

  -- Extra language servers for views and Stimulus
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        herb_ls = { mason = false }, -- installed via npm, see below
        stimulus_ls = {},
      },
    },
  },
}
