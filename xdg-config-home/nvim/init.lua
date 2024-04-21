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

local lsp = {
  "neovim/nvim-lspconfig",
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
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
        vim.keymap.set("n", "gd", function() require('telescope.builtin').lsp_definitions() end, opts)
        vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)
      end,
    })

    vim.api.nvim_create_augroup("AutoFormat", {})
    vim.api.nvim_create_autocmd(
        "BufWritePre",
        {
            pattern = "*",
            group = "AutoFormat",
            callback = function()
                vim.lsp.buf.format { async = false }
            end,
        }
    )
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
        ["<Up>"] = cmp.mapping.scroll_docs(-4),
        ["<Down>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Up
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Down
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

local ff = {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup{
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      }
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<Leader>g', builtin.live_grep, {})
    vim.keymap.set('n', '<Leader>b', builtin.buffers, {})
  end,
}

local plugins = { colorscheme, lsp, completion, ff }

require("lazy").setup(plugins, {})

local nolua_vim = vim.fn.stdpath("config") .. "/nolua.vim"
vim.cmd("so " .. nolua_vim)
