return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function()
    return {
      window = {
        mappings = {
          ["i"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            },
          },
          ["o"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["a"] = "rename",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_hidden = true, -- only works on Windows for hidden files/directories
        },
      },
    }
  end,
}
