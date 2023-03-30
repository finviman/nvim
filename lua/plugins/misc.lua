--
function Lazygit_toggle()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
  lazygit:toggle()
end

function Ranger_toggle()
  local Terminal = require("toggleterm.terminal").Terminal
  local ranger = Terminal:new({ cmd = "ranger", hidden = true, direction = "float" })
  ranger:toggle()
end

function Colorcolumn_toggle()
  local value = vim.api.nvim_get_option_value("colorcolumn", {})
  if value == "" then
    vim.api.nvim_set_option_value("colorcolumn", "79", {})
  else
    vim.api.nvim_set_option_value("colorcolumn", "", {})
  end
end

return {
  { "glepnir/zephyr-nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "akinsho/toggleterm.nvim", tag = "2.3.0", config = true },
  { "folke/which-key.nvim" },
  { "laishulu/vim-macos-ime", lazy = false },
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },
  { "windwp/nvim-autopairs", event="InsertEnter",config = true },

  {
    "mattn/emmet-vim",
    ft = { "vue", "html", "css", "scss", "sass" },
  },

  { "winston0410/commented.nvim", opts = {
    keybindings = { n = "gc", v = "gc", nl = "gcc" },
  } },

  {
    'echasnovski/mini.surround', version = '*',
    opts = {
      mappings = {
        add = '<space>ea', -- Add surrounding in Normal and Visual modes
        delete = '<space>ed', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = '<space>er', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    },
    config = function(_,opts)
      require('mini.surround').setup(opts)
    end,
  },

  {
    "phaazon/hop.nvim",
    cmd = { "HopChar2", "HopChar2MW" },
    config = true,
  },
  -- git sign
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { hl = "GitSignsAdd", text = "▌", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▌", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "◺", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "◺", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = {
          hl = "GitSignsChange",
          text = "▌",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 300,
      },
    },
  },

  -- nvim tree
  {
    "kyazdani42/nvim-tree.lua",
    opts = {
      respect_buf_cwd = true,
      filters = {
        dotfiles = true,
        custom = {
          "__pycache__",
          "node_modules",
          "*.iml",
          "target",
        },
      },
      view = {
        mappings = {
          list = {
            { key = "C", action = "cd" },
            { key = "O", action = "expand_all" },
            { key = "o", action = "open preview" },
          },
        },
      },
      on_attach = "disabled",
      remove_keymaps = { "<C-e>" },
    },
    cmd = { "NvimTreeFindFile", "NvimTreeToggle" },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies= { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
    config = function()
      require("telescope").load_extension("fzf")
      local action_layout = require("telescope.actions.layout")
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          prompt_prefix = "✎ ",
          selection_caret = "➳ ",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 80,
            },
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-k>"] = action_layout.toggle_preview,
            },
          },
          path_display = {
            "shorten",
            "absolute",
          },

          dynamic_preview_title = true,
        },
        extensions = {
          fzf = {
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
          },
        },
      })
    end,
  },

  -- snippet
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",                                                                                                                                                                         },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event="InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          }),
        },
      })
    end,
  },

  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
      { "<c-q>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true ,disable = {"python"} },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "java",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-q>",
          node_incremental = "<C-q>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
    }
}
