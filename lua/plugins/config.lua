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

require('impatient')
require('packer_compiled')

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
require('statusline.evil_lualine')
