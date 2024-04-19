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
    vim.cmd("colorscheme github_dark_default")
  end,
}
local lspconfig = {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp = require("lspconfig")
    lsp.rust_analyzer.setup {
      settings = {
        ['rust-analyzer'] = {},
      },
    }
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<K>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Leader>f", function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end,
}
local completion = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    cmp.setup {
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<C-j>"] = cmp.mapping.scroll_docs(4), -- Down
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    }
  end,
}
local plugins = { colorscheme, lspconfig, completion }

require("lazy").setup(plugins, {})

local nolua_vim = vim.fn.stdpath("config") .. "/nolua.vim"
vim.cmd("so " .. nolua_vim)

-- Used for CursorHold autocommand event
vim.opt.updatetime = 300
