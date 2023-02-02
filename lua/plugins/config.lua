local lspkind = require('lspkind')
local cmp = require'cmp'
cmp.setup({
  snippet = {
      expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      end,
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = {
      { name = 'buffer',
        option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        }
      },
      { name = 'path' },
      { name = 'nvim_lsp' }
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  }
})

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

function _lazygit_toggle()
  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction='float'})
  lazygit:toggle()
end
function _ranger_toggle()
  local Terminal  = require('toggleterm.terminal').Terminal
  local ranger = Terminal:new({ cmd = "ranger", hidden = true, direction='float'})
  ranger:toggle()
end

-- must before statusline config
vim.opt.termguicolors = true
require('zephyr') --speed colorscheme

-- lazy load gitsign
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

-- lazy load telescope
local function config_tele()
    require('telescope').load_extension('fzf')
    local action_layout = require('telescope.actions.layout')
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
            ["<esc>"] = actions.close,
            ["<C-k>"] = action_layout.toggle_preview
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
