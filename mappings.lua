-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
   n = {
      -- second key is the lefthand side of the map
      ["-"] = { "Nzzzv", desc = "N" },
      ["<S-h>"] = { "^", desc = "^" },
      ["<S-l>"] = { "$", desc = "$" },
      ["="] = { "nzzzv", desc = "n" },
      ["<leader>tt"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
      ["<C-Right>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["<C-Left>"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
      ["<A-1>"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
      ["<leader><CR>"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" },
      ["<leader>q"] = {
        function() require("bufdelete").bufdelete(0, false) end,
        desc = "Close buffer",
      },
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
      ["<C-Up>"] = { "8gk", desc = "up 8" },
      ["<C-Down>"] = { "8gj", desc = "down 8" },
      ["<C-_>"] = {
        function() require("Comment.api").toggle.linewise.current() end,
        desc = "Comment line",
      },
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
}
