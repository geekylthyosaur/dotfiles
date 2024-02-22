local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local colorscheme = {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme github_dark_colorblind")
  end
}

local whichkey = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeoutlen = 0
  end,
  opts = {
    window = {
      border = "single",
      margin = { 1, 1, 1, 0.8 },
      padding = { 0, 0, 0, 0 },
    },
    show_help = false,
    show_keys = false,
  }
}

local plugins = { colorscheme, whichkey }
local opts = {}

require("lazy").setup(plugins, opts)

local nolua_vim = vim.fn.stdpath("config") .. "/nolua.vim"
vim.cmd(":so " .. nolua_vim)

-- Used for CursorHold autocommand event
vim.opt.updatetime = 300
