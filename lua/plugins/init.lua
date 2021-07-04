vim.cmd [[packadd nvim-tree.lua]]
local function config_compe()
require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;
  
	source = {
	  path = true;
	  buffer = true;
	  calc = true;
	  nvim_lsp = true;
	  nvim_lua = true;
	--   vsnip = true;
	--   ultisnips = true;
	};
}
end

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
  current_line_blame_delay = 50,
  current_line_blame_position='eol',
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
        layout_defaults = {
            horizontal ={
                preview_width = 80
            }
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close
          }
        },
        shorten_path = true,
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

return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim'}
	use {'glepnir/zephyr-nvim'}
	use {'glepnir/galaxyline.nvim',config=function () require'statusline.evilline' end}
	use {'kyazdani42/nvim-web-devicons'}
	use {'nvim-lua/plenary.nvim'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {'hrsh7th/nvim-compe',opt=true,event="InsertEnter",config=config_compe}
	use {'nvim-telescope/telescope.nvim',opt=true,cmd={'Telescope'},config=config_tele,requires = {'nvim-lua/popup.nvim'}}
	use {'nvim-telescope/telescope-fzf-native.nvim',run = 'make'}
	use {'kyazdani42/nvim-tree.lua',opt=true}
	use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}
	use {'folke/which-key.nvim'}
	use {'lewis6991/gitsigns.nvim',opt=true,event='BufRead',config=config_gitSign}
	use {'sindrets/diffview.nvim',opt=true,cmd='DiffviewOpen'}
	use {'akinsho/nvim-toggleterm.lua'}
	use {'b3nj5m1n/kommentary'} 
  use {'steelsojka/pears.nvim',config=function() require "pears".setup() end}
end)
