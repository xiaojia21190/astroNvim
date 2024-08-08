-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.api.nvim_create_augroup("astronvim_intput", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  desc = "InsertLeave",
  group = "astronvim_intput",
  callback = function()
    if vim.fn.has "win32" == 0  then
      vim.cmd ":silent :!~/.config/nvim/lua/user/im-select.exe 1033"
    else
      vim.cmd ":silent :!C:/Users/wenshuaijia/im-select.exe 1033"
    end
  end
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  desc = "InsertEnter",
  group = "astronvim_intput",
  callback = function()
    if vim.fn.has "win32" == 0  then
      vim.cmd ":silent :!~/.config/nvim/lua/user/im-select.exe 2052"
    else
      vim.cmd ":silent :!C:/Users/wenshuaijia/im-select.exe 2052" 
    end
  end
})
