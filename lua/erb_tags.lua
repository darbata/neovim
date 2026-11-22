-- blink.cmp source: typing `=` or `%` in eruby offers `<%= %>` / `<% %>`
local source = {}

local tags = {
  ["="] = { label = "<%= %>", body = "<%= $1 %>$0" },
  ["%"] = { label = "<% %>", body = "<% $1 %>$0" },
}

function source.new()
  return setmetatable({}, { __index = source })
end

function source:get_trigger_characters()
  return { "=", "%" }
end

function source:get_completions(ctx, callback)
  local row, col = ctx.cursor[1], ctx.cursor[2]
  local char = ctx.line:sub(col, col)
  local before = ctx.line:sub(1, col - 1)
  local tag = tags[char]
  local items = {}

  -- skip when already writing a tag by hand (`<%`, `<%=`)
  if tag and not (before .. char):match("<%%=?$") then
    items[1] = {
      label = tag.label,
      kind = require("blink.cmp.types").CompletionItemKind.Snippet,
      insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
      textEdit = {
        newText = tag.body,
        range = {
          start = { line = row - 1, character = col - 1 },
          ["end"] = { line = row - 1, character = col },
        },
      },
    }
  end

  callback({ items = items, is_incomplete_forward = false, is_incomplete_backward = false })
end

return source
