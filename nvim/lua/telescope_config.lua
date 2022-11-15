require('telescope').load_extension('fzy_native')

local actions = require("telescope.actions")

require('telescope').setup{
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--no-ignore-vcs" }
    }
  },
  defaults = {
    file_ignore_patterns = {"vendor/.*", "coverage/.*", "tmp/.*"},
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      }
    }
  }
}
