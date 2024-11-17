local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})
vim.g.user_emmet_leader_key = '<C-g>'

map('c', '<C-A>','<Home>')
map('c', '<C-E>','<End>')
map('c', '<C-j>','<Down>')
map('c', '<C-k>','<Up>')
map('i', '<C-a>','<Home>')
map('i', '<C-e>','<End>')
map('i', '<C-f>','<Right>')
map('i', '<C-b>','<Left>')
map('i', '<C-n>','<Down>')
map('i', '<C-p>','<Up>')
map('i', '<C-d>','<Del>')
map('i', '<C-h>','<Backspace>')
map('i', '<C-k>','<Esc>lC')
map('i', '<C-s>','<Esc>:w<cr>a')
map('n', '<Esc>',':nohl|Noice dismiss<cr>',{silent=true})
map('n', '<M-[>',':put =repeat(nr2char(10), v:count1)<cr>')
map('n', '<M-]>',':put! =repeat(nr2char(10), v:count1)<cr>')
map('n', 'k','gk')
map('n', 'j','gj')
map('n', 'Y','y$')
map('n', 'n','nzzzv')
map('n', 'N','Nzzzv')
map('n', '<M-j>','mz:m+<cr>`z')
map('n', '<M-k>','mz:m-2<cr>`z')
map('n', '<space><space>','<S-:>')
map('v', '<M-j>',":m'>+<cr>`<my`>mzgv`yo`z")
map('v', '<M-k>',":m'<-2<cr>`>my`<mzgv`yo`z")
map('n', '<D-j>','mz:m+<cr>`z')
map('n', '<D-k>','mz:m-2<cr>`z')
map('v', '<D-j>',":m'>+<cr>`<my`>mzgv`yo`z")
map('v', '<D-k>',":m'<-2<cr>`>my`<mzgv`yo`z")
map('n', '<leader>y','"+y')
map('n', '<leader>w',':w<CR>')
map('x', '<leader>y','"+y')
map('n', '<leader>d','"+yydd')
map('',  '<C-j>','<C-W>j ')
map('',  '<C-k>','<C-W>k')
map('',  '<C-h>','<C-W>h')
map('',  '<C-l>','<C-W>l')
map('t', '<Esc>',"<C-\\><C-n>",{silent=true})

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
  win = {
    border = "single",
  }
}

local codeBase = '/home/yli/Program/github/'
local wk = require("which-key")
wk.add({
    { "<Space>Q", "<cmd>qa!<cr>", desc = "quit-no-save" },

    { "<Space>b", group = "Buffer" },
    { "<Space>bD", "<cmd>Bclose<cr>", desc = "kill-other-buffers" },
    { "<Space>b[", "<cmd>bprevious<cr>", desc = "previous-buffer" },
    { "<Space>b]", "<cmd>bnext<cr>", desc = "next-buffer" },
    { "<Space>bb", "<cmd>Telescope buffers<cr>", desc = "buffer list" },
    { "<Space>bd", "<cmd>bp|bd #<cr>", desc = "kill-buffer" },
    { "<Space>bs", "<cmd>HopChar2<cr>", desc = "easy motion" },

    { "<Space>c", group = "Code" },
    { "<Space>cR", "<cmd>Lspsaga rename<cr>", desc = "rename symbol" },
    { "<Space>c[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "pre diagnostics" },
    { "<Space>c]", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "next diagnostics" },
    { "<Space>ca", "<cmd>Lspsaga code_action<cr>", desc = "code action" },
    { "<Space>cc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "show diagnostics" },
    { "<Space>cd", "<cmd>Telescope lsp_definitions<cr>", desc = "to definition" },
    { "<Space>ce", "<cmd>!python %<cr>", desc = "Run!" },
    { "<Space>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "format code" },
    { "<Space>ch", "<cmd>Lspsaga hover_doc<cr>", desc = "code doc" },
    { "<Space>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "to implementation" },
    { "<Space>cr", "<cmd>Telescope lsp_references<cr>", desc = "to reference" },
    { "<Space>cs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "symbols finder" },
    { "<Space>ct", "<cmd>Telescope treesitter<cr>", desc = "tag list" },

    { "<Space>d", group = "Debug" },
    { "<Space>dO", "<cmd>DapStepOver<cr>", desc = "Step Over" },
    { "<Space>db", "<cmd>DapToggleBreakpoint<cr>", desc = "toggle breakpoint" },
    { "<Space>dc", "<cmd>DapContinue<cr>", desc = "start/continue" },
    { "<Space>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
    { "<Space>do", "<cmd>DapStepOut<cr>", desc = "Step Out" },
    { "<Space>dr", "<cmd>DapToggleRepl<cr>", desc = "Toggle REPL" },
    { "<Space>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
    { "<Space>du", "<cmd>DapUiToggle<cr>", desc = "DapUi" },

    { "<Space>e", group = "Edit" },
    { "<Space>et", "<cmd><cr>", desc = "text align" },

    { "<Space>f", group = "Files" },
    { "<Space>fS", "<cmd>wa<cr>", desc = "save all" },
    { "<Space>fd", "<cmd>lua Ranger_toggle()<cr>", desc = "ranger" },
    { "<Space>ff", "<cmd>Telescope find_files<cr>", desc = "project file list" },
    { "<Space>fg", "<cmd>Telescope git_files<cr>", desc = "git repo file list" },
    { "<Space>fl", "<cmd>checktime<cr>", desc = "load new change" },
    { "<Space>fr", "<cmd>Telescope oldfiles<cr>", desc = "history files" },
    { "<Space>fs", "<cmd>w<cr>", desc = "save file" },
    { "<Space>ft", "<cmd>NvimTreeToggle<cr>", desc = "neo-tree" },
    { "<Space>fw", "<cmd>w !sudo tee %<cr><cr>", desc = "sudo write" },
    { "<Space>g", group = "Git" },

    { "<Space>g/", "<cmd>Telescope live_grep<cr>", desc = "search in git files" },
    { "<Space>g<", "<cmd>diffget<cr>", desc = "diffget" },
    { "<Space>g>", "<cmd>diffput<cr>", desc = "diffput" },
    { "<Space>g[", '<cmd>lua require"gitsigns.actions".prev_hunk()<cr>', desc = "previous changed chunk" },
    { "<Space>g]", '<cmd>lua require"gitsigns.actions".next_hunk()<cr>', desc = "next changed chunk" },
    { "<Space>gb", "<cmd>BlameToggle<cr>", desc = "git blame" },
    { "<Space>gd", "<cmd>DiffviewOpen<cr>", desc = "git diff --cached" },
    { "<Space>gg", "<cmd>lua Lazygit_toggle()<cr>", desc = "lazygit" },
    { "<Space>go", "<cmd>Telescope git_branches<cr>", desc = "git branch list" },
    { "<Space>gr", '<cmd>lua require"gitsigns".reset_hunk()<cr>', desc = "revert current change" },
    { "<Space>gs", "<cmd>Telescope git_status<cr>", desc = "git status" },

    { "<Space>p", group = "Projects" },
    { "<Space>p/", "<cmd>Telescope live_grep cwd=/home/yli/Program/github/<cr>", desc = "find string in codebase" },
    { "<Space>pD", "<cmd>Telescope grep_string cwd=/home/yli/Program/github/<cr>", desc = "cursor word in codebase" },
    { "<Space>pd", "<cmd>Telescope grep_string<cr>", desc = "cursor word in project" },
    { "<Space>pf", "<cmd>Telescope find_files cwd=/home/yli/Program/github/<cr>", desc = "files in codebase" },
    { "<Space>pl", "<cmd>NvimTreeFindFile<cr>", desc = "locate file in FileTree" },
    { "<Space>ps", "<cmd>Telescope projects<cr>", desc = "switch projects" },
    { "<Space>q", "<cmd>q<cr>", desc = "quit" },

    { "<Space>t", group = "Toggle" },
    { "<Space>t(", "<cmd>rainbow_main#toggle()<cr>", desc = "rainbow brackets" },
    { "<Space>tc", "<cmd>lua Colorcolumn_toggle()<cr>", desc = "color column 80" },
    { "<Space>tf", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" },
    { "<Space>ti", "<cmd>IndentLinesToggle<cr>", desc = "indent line" },
    { "<Space>tl", "<cmd>set list!<cr>", desc = "nonvisual char" },
    { "<Space>tr", "<cmd>NumberToggle<cr>", desc = "relativenumber" },
    { "<Space>ts", "<cmd>ToggleTerm<cr>", desc = "shell" },
    { "<Space>tt", "<cmd>Lspsaga outline<cr>", desc = "symbols outline" },
    { "<Space>tw", "<cmd>set wrap!<cr>", desc = "line wrap" },
    { "<Space>tz", "<cmd>Limelight!!<cr>", desc = "zen mode" },

    { "<Space>v", group = "Vim" },
    { "<Space>vS", "<cmd>luafile %<cr>", desc = "load config" },
    { "<Space>va", "<cmd>Telescope commands<cr>", desc = "action commands" },
    { "<Space>vc", "<cmd>Telescope command_history<cr>", desc = "command history" },
    { "<Space>ve", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", desc = "init.nvim" },
    { "<Space>vf", "<cmd>Telescope filetypes<cr>", desc = "filetypes" },
    { "<Space>vh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
    { "<Space>vm", "<cmd>Telescope marks<cr>", desc = "marks" },
    { "<Space>vr", "<cmd>Telescope registers<cr>", desc = "registers" },
    { "<Space>vs", "<cmd>Telescope search_history<cr>", desc = "search history" },
    { "<Space>vt", "<cmd>Telescope colorscheme<cr>", desc = "colorschemes" },

    { "<Space>w", group = "Windows" },
    { "<Space>w=", "<C-W>=", desc = "balance-window" },
    { "<Space>wH", "<C-W>8<", desc = "expand-window-left" },
    { "<Space>wJ", "<cmd>resize +5<cr>", desc = "expand-window-below" },
    { "<Space>wK", "<cmd>resize +5<cr>", desc = "expand-window-up" },
    { "<Space>wL", "<C-W>8>", desc = "expand-window-right" },
    { "<Space>wd", "<C-W>q", desc = "close window" },
    { "<Space>wf", "<cmd>HopChar2MW<cr>", desc = "easy motion" },
    { "<Space>wh", "<C-W>h", desc = "window-left" },
    { "<Space>wj", "<C-W>j", desc = "window-below" },
    { "<Space>wk", "<C-W>k", desc = "window-up" },
    { "<Space>wl", "<C-W>l", desc = "window-right" },
    { "<Space>wm", "<C-W>|<C-W>_", desc = "maximum-window" },
    { "<Space>ws", "<C-W>s", desc = "split-window-below" },
    { "<Space>wv", "<C-W>v", desc = "split-window-right" },
    { "<Space>wx", "<C-W>x", desc = "swap 2 windows" },
})

