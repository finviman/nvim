local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','
vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})
vim.g.user_emmet_leader_key = '<C-g>'

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
map('i', '<C-s>','<Esc>:w<cr>a')
map('n', '<Esc>',':nohl<cr>',{silent=true})
map('n', '<M-[>',':put =repeat(nr2char(10), v:count1)<cr>')
map('n', '<M-]>',':put! =repeat(nr2char(10), v:count1)<cr>')
map('n', 'k','gk')
map('n', 'j','gj')
map('n', 'Y','y$')
map('n', 'n','nzzzv')
map('n', 'N','Nzzzv')
map('n', '<M-j>','mz:m+<cr>`z')
map('n', '<space><space>','<S-:>')
map('n', '<M-k>','mz:m-2<cr>`z')
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
  window = {
    border = "single",
  }
}

local wk = require("which-key")
local function cmd(s)
  return '<cmd>'..s..'<cr>'
end
local codeBase = '/home/yli/Program/github/'
wk.register({
    q = {cmd('q')   , 'quit'}         ,
    Q = {cmd('qa!') , 'quit-no-save'} ,

    f = {
      name = '+Files',
      f = {cmd('Telescope find_files') , 'project file list'} ,
      r = {cmd('Telescope oldfiles')   , 'history files'}     ,
      s = {cmd('w')                    , 'save file'}         ,
      S = {cmd('wa')                   , 'save all'}          ,
      t = {cmd('NvimTreeToggle')       , 'neo-tree'}          ,
      l = {cmd('checktime')            , 'load new change'}   ,
      d = {cmd('lua _ranger_toggle()') , 'ranger'}            ,
      w = {cmd('w !sudo tee %<cr>')        , 'sudo write'}        ,
    },

    b = {
       name='+Buffer'                ,
       b = {cmd('Telescope buffers') , 'buffer list'}        ,
       d = {cmd('bp|bd #')           , 'kill-buffer'}        ,
       D = {cmd('Bclose')            , 'kill-other-buffers'} ,
       [']'] = {cmd('bnext')         , 'next-buffer'}        ,
       ['['] = {cmd('bprevious')     , 'previous-buffer'}    ,
       s = {cmd('HopChar1')          , 'easy motion'}        ,
    },

    c = {
       name='+Code'                                       ,
       a = {cmd('Telescope lsp_code_actions')             , 'code action'}       ,
       d = {cmd('Telescope lsp_definitions')              , 'to definition'}     ,
       r = {cmd('Telescope lsp_references')               , 'to reference'}      ,
       f = {cmd('lua vim.lsp.buf.formatting()')           , 'format code'}       ,
       ['['] = {cmd('lua vim.lsp.diagnostic.goto_prev()') , 'pre diagnostics'}   ,
       [']'] = {cmd('lua vim.lsp.diagnostic.goto_next()') , 'next diagnostics'}  ,
       e = {cmd('!python %')                              , 'Run!'}              ,
       t = {cmd('Telescope treesitter')                   , 'tag list'}          ,
       i = {cmd('Telescope lsp_implementations')          , 'to implementation'} ,
       z = {cmd(':call ToggleFold()')                     , 'fold/unfold code'}  ,
       h = {cmd('lua vim.lsp.buf.hover()')                , 'code doc'}          ,
       l = {cmd('Telescope loclist')                      , 'location list'}     ,
    }                                                     ,

    g = {
      name = "+Git"                                             ,
      b = {cmd('Gitsigns toggle_current_line_blame')            , 'git blame'}               ,
      a = {':Git add %'                                         , 'git stage current'}       ,
      A = {':Git add .'                                         , 'git stage all'}           ,
      o = {cmd('Telescope git_branches')                        , 'git branch list'}         ,
      s = {cmd('Telescope git_status')                          , 'git status'}              ,
      c = {':Git commit'                                        , 'git commit'}              ,
      P = {':Git --no-pager push'                               , 'git push to remote'}      ,
      p = {':Git pull'                                          , 'git pull'}                ,
      ['['] = {cmd('lua require"gitsigns.actions".prev_hunk()') , 'previous changed chunk'}  ,
      [']'] = {cmd('lua require"gitsigns.actions".next_hunk()') , 'next changed chunk'}      ,
      r = {cmd('lua require"gitsigns".reset_hunk()')            , 'revert current change'}   ,
      d = {cmd('DiffviewOpen')                                  , 'git diff --cached'}       ,
      w = {'Gbrowse'                                            , 'browse remote host file'} ,
      ['/'] = {cmd('Telescope live_grep')                       , 'search in git files'}     ,
      ['<'] = {cmd('diffget')                                   , 'diffget'}                 ,
      ['>'] = {cmd('diffput')                                   , 'diffput'}                 ,
      l = {cmd("lua _lazygit_toggle()")                         , 'lazygit'}                 ,
    }                                                           ,

    p = {
      name= '+Projects'                                  ,
      f = {cmd('Telescope find_files cwd='..codeBase)    , 'files in codebase'}       ,
      l = {cmd('NvimTreeFindFile')                       , 'locate file in FileTree'} ,
      d = {cmd('Telescope grep_string')                  , 'cursor word in project'}  ,
      D = {cmd('Telescope grep_string cwd='..codeBase )  , 'cursor word in codebase'} ,
      ['/'] = {cmd('Telescope live_grep cwd='..codeBase) , 'find string in codebase'} ,
    }                                                    ,

    t = {
       name='+Toggle'                        ,
       f = {cmd('NvimTreeToggle')            , 'File Tree'}        ,
       r = {cmd('NumberToggle')              , 'relativenumber'}   ,
       s = {cmd('ToggleTerm')                , 'shell'}            ,
       ['('] = {cmd('rainbow_main#toggle()') , 'rainbow brackets'} ,
       i = {cmd('IndentLinesToggle')         , 'indent line'}      ,
       z = {cmd('Limelight!!')               , 'zen mode'}         ,
       w = {cmd('set wrap!')                 , 'line wrap'}        ,
       l = {cmd('set list!')                 , 'nonvisual char'}   ,
       t = {cmd('SymbolsOutline')            , 'SymbolsOutline'}   ,
    }                                        ,

    v = {
      name = '+Vim'                                       ,
      a = {cmd('Telescope commands')                      , 'action commands'} ,
      t = {cmd('Telescope colorscheme')                   , 'colorschemes' }   ,
      e = {cmd('Telescope find_files cwd=~/.config/nvim') , 'init.nvim'}       ,
      S = {cmd('luafile %')                               , 'load config'}     ,
      s = {cmd('Telescope search_history')                , 'search history'}  ,
      h = {cmd('Telescope help_tags')                     , 'help tags'}       ,
      c = {cmd('Telescope command_history')               , 'command history'} ,
      r = {cmd('Telescope registers')                     , 'registers'}       ,
      m = {cmd('Telescope marks')                         , 'marks'}           ,
      f = {cmd('Telescope filetypes')                     , 'filetypes'}       ,
    }                                                     ,

    w = {
      name= '+Windows'      ,
      ['_'] = {'<C-W>s'     , 'split-window-below'}  ,
      ['|'] = {'<C-W>v'     , 'split-window-right'}  ,
      d = {'<C-W>q'         , 'close window'}        ,
      h = {'<C-W>h'         , 'window-left'}         ,
      j = {'<C-W>j'         , 'window-below'}        ,
      l = {'<C-W>l'         , 'window-right'}        ,
      k = {'<C-W>k'         , 'window-up'}           ,
      H = {'<C-W>8<'        , 'expand-window-left'}  ,
      J = {cmd('resize +5') , 'expand-window-below'} ,
      L = {'<C-W>8>'        , 'expand-window-right'} ,
      K = {cmd('resize -5') , 'expand-window-up'}    ,
      ['='] = {'<C-W>='     , 'balance-window'}      ,
      ['x'] = {'<C-W>x'     , 'swap 2 windows'}      ,
    }
  }, { prefix = "<Space>" })
