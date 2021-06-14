local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','
vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})

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
map('n', '<space><space>','<S-:>')
map('n', '<M-k>','mz:m-2<cr>`z')
map('v', '<M-j>',":m'>+<cr>`<my`>mzgv`yo`z")
map('v', '<M-k>',":m'<-2<cr>`>my`<mzgv`yo`z")
map('n', '<D-j>','mz:m+<cr>`z')
map('n', '<D-k>','mz:m-2<cr>`z')
map('v', '<D-j>',":m'>+<cr>`<my`>mzgv`yo`z")
map('v', '<D-k>',":m'<-2<cr>`>my`<mzgv`yo`z")
map('n', '<leader>y','"+y')
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
}


local wk = require("which-key")
local function cmd(s)
  return '<cmd>'..s..'<cr>'
end
wk.register({
    q = {cmd('q'),'quit'},
    Q = {cmd('qa!'),'quit-no-save'},

    f = {
      name = '+Files',
      f = {cmd('Telescope find_files shorten_path=true')      , 'project file list'}   ,
      r = {cmd('Telescope oldfiles shorten_path=true')       , 'history files'} ,
      s = {cmd('w')                , 'save file'}           ,
      S = {cmd('wa')                , 'save all'}           ,
      t = {cmd('NvimTreeToggle')   , 'neo-tree'}         ,
      l = {'checktime'        , 'load new change'}     ,
      d = {cmd('lua _ranger_toggle()')        , 'ranger'}     ,
    },

    b = {
       name='+Buffer'                  ,
       b = {cmd('Telescope buffers shorten_path=true')              , 'buffer list'}        ,
       d = {cmd('bp|bd #'                  ) , 'kill-buffer'}        ,
       D = {cmd('Bclose'                    ) , 'kill-other-buffers'} ,
       [']'] = {cmd('bnext'                     ) , 'next-buffer'}        ,
       ['['] = {cmd('bprevious'                 ) , 'previous-buffer'}    ,
       s = {cmd('<Plug>(easymotion-prefix)s') , 'easy motion'}        ,
    },

    g = {
      name = "+Git",
      b = {cmd('Gitsigns toggle_current_line_blame')                 , 'git blame'}               ,
      a = {':Git add %'                 , 'git stage current'}       ,
      A = {':Git add .'                 , 'git stage all'}           ,
      o = {cmd('Telescope git_branches')    , 'git branch list'}         ,
      s = {cmd('lua neogit.open({ kind = "split" })')                        , 'git status'}              ,
      c = {':Git commit'                , 'git commit'}              ,
      P = {':Git --no-pager push'       , 'git push to remote'}      ,
      p = {':Git pull'                  , 'git pull'}                ,
      ['['] = {':call PrevHunkAllBuffers()' , 'previous changed chunk'}  ,
      [']'] = {':call NextHunkAllBuffers()' , 'next changed chunk'}      ,
      r = {'GitGutterUndoHunk'          , 'revert current change'}   ,
      d = {cmd('DiffviewOpen')                , 'git diff --cached'}       ,
      w = {'Gbrowse'                    , 'browse remote host file'} ,
      ['/'] = {cmd('Telescope live_grep shorten_path=true')       , 'search in git files'}     ,
      ['<'] = {':diffget'                   , 'diffget'}                 ,
      ['>'] = {':diffput'                   , 'diffput'}                 ,
      l = {cmd("lua _lazygit_toggle()")                   , 'lazygit'}                 ,
    },

    t = {
       name='+Toggle'             ,
       f = {cmd('NvimTreeToggle'),   'File Tree'}             ,
       r = {cmd('NumberToggle'          ), 'relativenumber'}   ,
       s = {cmd('ToggleTerm'        ), 'shell'}            ,
       ['('] = {cmd('rainbow_main#toggle()' ), 'rainbow brackets'} ,
       i = {cmd('IndentLinesToggle'     ), 'indent line'}      ,
       z = {cmd('Limelight!!'          ), 'zen mode'}         ,
       w = {cmd('set wrap!'            ), 'line wrap'}        ,
       l = {cmd('set list!'            ), 'nonvisual char'}   ,
    },

    v = {
      name = '+Vim',
      a = {cmd('Telescope commands'       ) , 'action commands'} ,
      t = {cmd('Telescope colorscheme'    ) , 'colorschemes' }   ,
      e = {cmd('e $MYVIMRC'               ) , 'init.nvim'}    ,
      S = {cmd('Reload'                   ) , 'load config'}    ,
      s = {cmd('Telescope search_history' ) , 'search history'}  ,
      h = {cmd('Telescope help_tags'      ) , 'help tags'}       ,
      c = {cmd('Telescope command_history') , 'command history'} ,
      r = {cmd('Telescope registers'      ) , 'registers'}       ,
      m = {cmd('Telescope marks'          ) , 'marks'}           ,
      f = {cmd('Telescope filetypes'      ) , 'filetypes'}       ,
    }
  }, { prefix = "<Space>" })

