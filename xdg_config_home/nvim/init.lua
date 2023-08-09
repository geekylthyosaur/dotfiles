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
  autoremove = true,
})
require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  -- Collection of common configurations for the Nvim LSP client
  use("neovim/nvim-lspconfig")
  -- Visualize lsp progress
  use({
    "j-hui/fidget.nvim", tag = 'legacy',
    config = function()
      require("fidget").setup()
    end
  })

  -- Autocompletion framework
  use("hrsh7th/nvim-cmp")
  use({
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    "hrsh7th/cmp-vsnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })
  -- See hrsh7th other plugins for more great completion sources!
  -- Snippet engine
  use('hrsh7th/vim-vsnip')
  -- Adds extra functionality over rust analyzer
  use("simrat39/rust-tools.nvim")

  -- Optional
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")

  -- Show diagnostics on top right
  use {'Mofiqul/trld.nvim'}
  -- Some color scheme other then default
  -- use("morhetz/gruvbox")
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.diagnostic.config({ 
    virtual_text = false, 
})
local function on_attach(client, buffer)
    local keymap_opts = { buffer = buffer }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
end

local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  server = {
    -- cmd = { "ra-multiplex" },
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
      },
    },
  },
}
require("rust-tools").setup(opts)

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})

require('trld').setup {
  -- where to render the diagnostics. 'top' | 'bottom'
  position = 'top',

  -- if this plugin should execute it's builtin auto commands
  auto_cmds = true,

  -- diagnostics highlight group names
  highlights = {
    error = "DiagnosticFloatingError",
    warn =  "DiagnosticFloatingWarn",
    info =  "DiagnosticFloatingInfo",
    hint =  "DiagnosticFloatingHint",
  },

  formatter = function(diag)
    local u = require 'trld.utils'
    local diag_lines = {}

    for line in diag.message:gmatch("[^\n]+") do
      line = line:gsub('[ \t]+%f[\r\n%z]', '')
      table.insert(diag_lines, line)
    end

    local lines = {}
    for _, diag_line in ipairs(diag_lines) do
      table.insert(lines, { { diag_line .. ' ', u.get_hl_by_serverity(diag.severity) } })
    end

    return lines
  end,
}

local nolua_vim = vim.fn.stdpath('config') .. '/nolua.vim'
vim.cmd(':so ' .. nolua_vim)
