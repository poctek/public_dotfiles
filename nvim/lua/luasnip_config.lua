local luasnip = require'luasnip'

require("luasnip.loaders.from_vscode").load({
  include = { "ruby" },
  paths = { "~/.vim/plugged/friendly-snippets" }
})

luasnip.config.set_config {
 history = true,
 updateevents = "TextChanged,TextChangedI",
}
