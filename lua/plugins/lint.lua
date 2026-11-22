local cspell_config = vim.fn.stdpath("config") .. "/cspell.json"

return {
  -- Flag misspelled identifiers (e.g. `sesision`) in Ruby and ERB; words to allow go in cspell.json
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ruby = { "cspell" },
        eruby = { "cspell" },
      },
      linters = {
        cspell = {
          args = {
            "lint",
            "--no-color",
            "--no-progress",
            "--no-summary",
            "--config",
            cspell_config,
            function()
              return "stdin://" .. vim.api.nvim_buf_get_name(0)
            end,
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "cspell" } },
  },
}
