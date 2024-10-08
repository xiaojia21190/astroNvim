return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          ["-"] = { "Nzzzv", desc = "N" },
          ["<S-h>"] = { "^", desc = "^" },
          ["<S-l>"] = { "$", desc = "$" },
          ["="] = { "nzzzv", desc = "n" },
          ["<leader>tt"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
          ["<A-Right>"] = {
            function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
            desc = "Next buffer",
          },
          ["<A-Left>"] = {
            function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
            desc = "Previous buffer",
          },
          ["<A-1>"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
          ["<leader><CR>"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" },
          ["<leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
          ["<CS-f>"] = {
            function()
              require("telescope.builtin").live_grep {
                additional_args = function(args) return vim.list_extend(args, { "--no-ignore" }) end,
              }
            end,
            desc = "Search words in all files",
          },
          ["<C-f>"] = {
            function() require("telescope.builtin").grep_string() end,
            desc = "Search for word under cursor",
          },
          ["<C-e>"] = {
            function() require("telescope.builtin").find_files { no_ignore = true } end,
            desc = "Search all files",
          },
          ["<C-z>"] = { "u", desc = "undo" },
          ["<C-Up>"] = { "12gk", desc = "up 12" },
          ["<C-Down>"] = { "12gj", desc = "down 12" },
          ["<C-_>"] = {
            function() require("Comment.api").toggle.linewise.current() end,
            desc = "Comment line",
          },
          ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
          ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
          ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
          ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
          ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
        },
        v = {
          ["<C-_>"] = {
            "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
            desc = "Toggle comment line",
          },
          ["<C-Up>"] = { "5gk", desc = "up 5" },
          ["<C-Down>"] = { "5gj", desc = "down 5" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
