return require('packer').startup({function(use)
	use {'wbthomason/packer.nvim'}
	use {'glepnir/zephyr-nvim'}
	use {'nvim-lualine/lualine.nvim'}
	use {'kyazdani42/nvim-web-devicons'}
	use {'nvim-lua/plenary.nvim'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,              -- false will disable the whole extension
      },
    }
  end
  }
  use {'onsails/lspkind.nvim'}
  use {'hrsh7th/nvim-cmp',
    requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    }
  }
	use {'nvim-telescope/telescope.nvim',opt=true,cmd={'Telescope'},config=config_tele,requires = { {'nvim-lua/plenary.nvim'} }}
	use {'nvim-telescope/telescope-fzf-native.nvim',run = 'make'}
	use {'kyazdani42/nvim-tree.lua',
    config = function() 
    require'nvim-tree'.setup {
        respect_buf_cwd= true,
        filters = {
            custom = {'.git', 'node_modules', '.cache','.idea','.settings','.classpath','.project','*.iml','target'}
        },
        view = {
            mappings = {
                list = {
                    {key="C",action="cd"},
                    {key="O",action="expand_all"},
                    {key="o",action="preview"},
                }
            }
        },
        on_attach = "disabled",
        remove_keymaps = {"<C-e>"}
    } end,
    opt=true,cmd={'NvimTreeFindFile','NvimTreeToggle'}}
	use {'neovim/nvim-lspconfig'}
  use {'williamboman/nvim-lsp-installer'}
	use {'folke/which-key.nvim'}
	use {'laishulu/vim-macos-ime'}
	use {'lewis6991/gitsigns.nvim',opt=true,event='BufRead',config=config_gitSign}
	use {'sindrets/diffview.nvim',opt=true,cmd='DiffviewOpen'}
	use {'simrat39/symbols-outline.nvim',opt=true,cmd='SymbolsOutline',
    config = function()
      require("symbols-outline").setup()
    end
  }
	use {'akinsho/nvim-toggleterm.lua',
    config = function()
      require("toggleterm").setup{}
    end
  }
  use {'steelsojka/pears.nvim',config=function() require "pears".setup() end}
  use {'lewis6991/impatient.nvim'}
  use {'phaazon/hop.nvim', as = 'hop',opt=true,cmd={'HopChar1'},
    config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use{'winston0410/commented.nvim',
    config = function() require('commented').setup({
          keybindings = {n = "gc", v = "gc", nl = "gcc"},
    }) end
  }
  use {"ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup{detection_methods = { "pattern" }}
    end
  }
  use {"mattn/emmet-vim",opt=true,ft={'vue','html','css','scss','sass'}
  }
end,
config = {
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})

