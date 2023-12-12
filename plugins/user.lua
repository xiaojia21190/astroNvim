return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "SirVer/ultisnips",
    event = "InsertEnter",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<NUL>"
      vim.g.UltiSnipsJumpForwardTrigger = "<NUL>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<NUL>"
      vim.g.UltiSnipsEditSplit = "vertical"
    end,
  },
  {
    "jayli/vim-easycomplete",
    event = "InsertEnter",
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    cmd = "Telescope",
    opts = function()
      local actions = require "telescope.actions"
      local get_icon = require("astronvim.utils").get_icon
      return {
        defaults = {
          git_worktrees = vim.g.git_worktrees,
          prompt_prefix = get_icon("Selected", 1),
          selection_caret = get_icon("Selected", 1),
          path_display = { "truncate" },
          file_ignore_patterns = {"node_modules"},
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = { q = actions.close },
          },
        },
      }
    end,
    config = require "plugins.configs.telescope",
  },
  {
    "jay-babu/mason-null-ls.nvim",

    opts = function(_, opts)
      opts.ensure_installed = { "prettierd" }
      if not opts.handlers then opts.handlers = {} end

      local function check_json_key_exists(filename, key)
        -- Open the file in read mode
        local file = io.open(filename, "r")
        if not file then
          return false -- File doesn't exist or cannot be opened
        end

        -- Read the contents of the file
        local content = file:read "*all"
        file:close()

        -- Parse the JSON content
        local json_parsed, json = pcall(vim.fn.json_decode, content)
        if not json_parsed or type(json) ~= "table" then
          return false -- Invalid JSON format
        end

        -- Check if the key exists in the JSON object
        return json[key] ~= nil
      end

      local has_prettier = function(util)
        return check_json_key_exists(vim.fn.getcwd() .. "/package.json", "prettier")
          or util.root_has_file ".prettierrc"
          or util.root_has_file ".prettierrc.json"
          or util.root_has_file ".prettierrc.yml"
          or util.root_has_file ".prettierrc.yaml"
          or util.root_has_file ".prettierrc.json5"
          or util.root_has_file ".prettierrc.js"
          or util.root_has_file ".prettierrc.cjs"
          or util.root_has_file "prettier.config.js"
          or util.root_has_file "prettier.config.cjs"
          or util.root_has_file ".prettierrc.toml"
      end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with { condition = has_prettier })
      end
    end,
  },
}
