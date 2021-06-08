local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('c', '<C-A>','<Home>')
map('c', '<C-E>','<End>')
map('c', '<C-j>','<t_kd>')
map('c', '<C-k>','<t_ku>')
map('i', '<C-a>','<Home>')
map('i', '<C-e>','<End>')
map('i', '<C-f>','<Right>')
map('i', '<C-b>','<Left>')
map('i', '<C-n>','<Down>')
map('i', '<C-p>','<Up>')
map('n', '<Esc>',':nohl<cr>',{silent=true})
map('n', '<M-[>',':put =repeat(nr2char(10), v:count1)<cr>')
map('n', '<M-]>',':put! =repeat(nr2char(10), v:count1)<cr>')
map('n', 'k','gk')
map('n', 'j','gj')
map('n', 'Y','y$')
map('n', '<M-j>','mz:m+<cr>`z')
map('n', '<M-k>','mz:m-2<cr>`z')
map('v', '<M-j>',":m'>+<cr>`<my`>mzgv`yo`z")
map('v', '<M-k>',":m'<-2<cr>`>my`<mzgv`yo`z")
map('n', '<D-j>','mz:m+<cr>`z')
map('n', '<D-k>','mz:m-2<cr>`z')
map('v', '<D-j>',":m'>+<cr>`<my`>mzgv`yo`z")
map('v', '<D-k>',":m'<-2<cr>`>my`<mzgv`yo`z")
map('n', '<localleader>y','"+y')
map('x', '<localleader>y','"+y')
map('n', '<localleader>d','"+yydd')
map('',  '<C-j>','<C-W>j ')
map('',  '<C-k>','<C-W>k')
map('',  '<C-h>','<C-W>h')
map('',  '<C-l>','<C-W>l')

require("which-key").setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = false,
    },
  },
}

local wk = require("which-key")
wk.register({
    f = {
      name = "file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false},
      n = { "New File" },
      e = "Edit File",
      ["1"] = "which_key_ignore",
      b = { function() print("bar") end, "Foobar" }
    },
  }, { prefix = "<Space>" })