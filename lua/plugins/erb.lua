return {
  -- Typing `=` / `%` in .html.erb pops up `<%= %>` / `<% %>` (see lua/erb_tags.lua)
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          eruby = { inherit_defaults = true, "erb_tags" },
        },
        providers = {
          erb_tags = { name = "ERB", module = "erb_tags", score_offset = 100 },
        },
      },
    },
  },
}
