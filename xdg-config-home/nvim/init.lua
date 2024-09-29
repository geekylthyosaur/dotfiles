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
    require("github-theme").setup({
      options = {
        -- Do not hide the '~' character at the end of the buffer
        hide_end_of_buffer = false,
        -- Do not override style of non-active statusline
        hide_nc_statusline = false,
      },
      groups = {
        all = {
          -- Set listchars nbsp, space, tab and trail fg to red
          Whitespace = { fg = "palette.red" },
        },
      },
    })

    local function set()
      local handle = io.popen("/usr/bin/gsettings get org.gnome.desktop.interface color-scheme")
      local result = handle:read("*a")
      handle:close()

      if result:match("'(.*)'") == "prefer-dark" then
        vim.cmd("colorscheme github_dark_default")
      else
        vim.cmd("colorscheme github_light_default")
      end
    end

    vim.api.nvim_create_autocmd("Signal", {
      pattern = "SIGUSR1",
      callback = function()
        set()
      end,
    })

    set()
  end,
}

local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "markdown", "rust" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

local lsp = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local lsp = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- FIXME: https://github.com/hrsh7th/nvim-cmp/issues/373
    capabilities.textDocument.completion.completionItem.snippetSupport = false

    lsp.rust_analyzer.setup {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {},
      },
    }
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "gd", function() builtin.lsp_definitions() end, opts)
        vim.keymap.set("n", "gr", function() builtin.lsp_references() end, opts)
        vim.keymap.set("n", "gi", function() builtin.lsp_implementations() end, opts)
        vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
      end,
    })

    vim.api.nvim_create_augroup("AutoFormat", {})
    vim.api.nvim_create_autocmd(
      "BufWritePre",
      {
        pattern = "*",
        group = "AutoFormat",
        callback = function()
          -- Can cause freeze on save
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
        ["<Up>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<Down>"] = cmp.mapping.scroll_docs(4), -- Down
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Up
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Down
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<Tab>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    }
  end,
}

local ff = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
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

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<Leader>F", builtin.git_files, {})
    vim.keymap.set("n", "<Leader>/", builtin.live_grep, {})
    vim.keymap.set("n", "<Leader>b", builtin.buffers, {})
  end,
}

local diagnostics = {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  opts = {
    scope = "line",
  },
}

local git = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end,
}

local pairs = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
}

local plugins = { colorscheme, treesitter, lsp, completion, ff, diagnostics, git, pairs }

require("lazy").setup(plugins, {})

local nolua_vim = vim.fn.stdpath("config") .. "/nolua.vim"
vim.cmd("so " .. nolua_vim)
