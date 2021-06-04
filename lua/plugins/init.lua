vim.cmd [[packadd nvim-tree.lua]]
vim.cmd [[packadd nvim-compe]]
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

  require'nvim-treesitter.configs'.setup {
	highlight = {
	  enable = true,              -- false will disable the whole extension
	},
  }

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'mhartington/oceanic-next'
	use 'glepnir/galaxyline.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {'hrsh7th/nvim-compe',opt=true,event="InsertEnter"}
	use 'neovim/nvim-lspconfig'
	use {'nvim-telescope/telescope.nvim',requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
	use {'kyazdani42/nvim-tree.lua',opt=true,cmd={'NvimTreeToggle','NvimTreeFindFile'}}
end)
