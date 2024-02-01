local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({
  -- Remove disabled or unused plugins without prompting the user
  autoremove = true,
})
require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Theme
  use {
    "projekt0n/github-nvim-theme",
    config = function()
      vim.cmd("colorscheme github_dark_default")
    end
  }

  -- Git
  use {
    "airblade/vim-gitgutter",
    config = function()
      vim.g.gitgutter_sign_added = "▍"
      vim.g.gitgutter_sign_modified = "▍"
      vim.g.gitgutter_sign_removed = "▔"
      vim.g.gitgutter_sign_removed_first_line = "▔"
      vim.g.gitgutter_sign_removed_above_and_below = "▔"
      vim.g.gitgutter_sign_modified_removed = "▍"
    end
  }
end)

-- The first run will install packer and plugins
if packer_bootstrap then
  require("packer").sync()
  return
end

local nolua_vim = vim.fn.stdpath("config") .. "/nolua.vim"
vim.cmd(":so " .. nolua_vim)

-- Used for CursorHold autocommand event
vim.opt.updatetime = 300
