vim.cmd [[packadd nvim-tree.lua]]
function config_cmp()
local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lsp' }
    }
  })
end

require('impatient')
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
local function config_gitSign()
require('gitsigns').setup{
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▌', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▌', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '◺', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '◺', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '▌', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 300,
  }
}
end

local function config_tele()
require('telescope').load_extension('fzf')
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        prompt_prefix = "✎ ",
        selection_caret = "➳ ",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal ={
                preview_width = 80
            }
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close
          }
        },
      path_display = {
        "shorten",
        "absolute",
        },

        dynamic_preview_title=true
    },
    extensions = {
    fzf = {
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    }
  }
}
end

require("toggleterm").setup{}
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction='float'})
function _lazygit_toggle()
  lazygit:toggle()
end
local ranger = Terminal:new({ cmd = "ranger", hidden = true, direction='float'})
function _ranger_toggle()
  ranger:toggle()
end

require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache','.idea','.settings','.classpath','.project','*.iml','target'}

require('feline').setup()
-- require('packer_compiled')
return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim'}
	use {'glepnir/zephyr-nvim'}
	use {'famiu/feline.nvim'}
	use {'kyazdani42/nvim-web-devicons'}
	use {'nvim-lua/plenary.nvim'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'hrsh7th/nvim-cmp',
    opt=true,event="InsertEnter",
    config=config_cmp,
    requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp"
    }
  }
	use {'FinallyFinancialFreedom/telescope.nvim',opt=true,cmd={'Telescope'},config=config_tele,requires = {'nvim-lua/popup.nvim'}}
	use {'nvim-telescope/telescope-fzf-native.nvim',run = 'make'}
	use {'kyazdani42/nvim-tree.lua',opt=true}
	use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}
	use {'folke/which-key.nvim'}
	use {'laishulu/vim-macos-ime'}
	use {'lewis6991/gitsigns.nvim',opt=true,event='BufRead',config=config_gitSign}
	use {'sindrets/diffview.nvim',opt=true,cmd='DiffviewOpen'}
	use {'simrat39/symbols-outline.nvim',opt=true,cmd='SymbolsOutline'}
	use {'akinsho/nvim-toggleterm.lua'}
	use {'b3nj5m1n/kommentary'}
  use {'steelsojka/pears.nvim',config=function() require "pears".setup() end}
  use {'lewis6991/impatient.nvim',config = {
    compile_path = '~/.config/nvim/lua/plugin/packer_compiled.lua'
  }
  }
  use {'phaazon/hop.nvim', as = 'hop',opt=true,cmd={'HopChar1'},
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end}
end)
