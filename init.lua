require'statusline.evilline'
require'plugins'

vim.cmd 'colorscheme OceanicNext'
local function load_options()
    local global_local = {
      termguicolors  = true;
      mouse          = "nv";
      errorbells     = true;
      visualbell     = true;
      hidden         = true;
      fileformats    = "unix,mac,dos";
      magic          = true;
      virtualedit    = "block";
      encoding       = "utf-8";
      viewoptions    = "folds,cursor,curdir,slash,unix";
      sessionoptions = "curdir,help,tabpages,winsize";
    --   clipboard      = "unnamedplus";
      wildignorecase = true;
      wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
      backup         = false;
      writebackup    = false;
      swapfile       = false;
      history        = 2000;
      shada          = "!,'300,<50,@100,s10,h";
      backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
      smarttab       = true;
      shiftround     = true;
      timeout        = true;
      ttimeout       = true;
      timeoutlen     = 500;
      ttimeoutlen    = 10;
      updatetime     = 100;
      redrawtime     = 1500;
      ignorecase     = true;
      smartcase      = true;
      infercase      = true;
      incsearch      = true;
      wrapscan       = true;
      complete       = ".,w,b,k";
      inccommand     = "nosplit";
      grepformat     = "%f:%l:%c:%m";
      grepprg        = 'rg --hidden --vimgrep --smart-case --';
      breakat        = [[\ \	;:,!?]];
      startofline    = false;
      whichwrap      = "h,l,<,>,[,],~";
      splitbelow     = true;
      splitright     = true;
      switchbuf      = "useopen";
      backspace      = "indent,eol,start";
      diffopt        = "filler,iwhite,internal,algorithm:patience";
      completeopt    = "menuone,noselect";
      jumpoptions    = "stack";
      showmode       = false;
      shortmess      = "aoOTIcF";
      scrolloff      = 2;
      sidescrolloff  = 5;
      foldlevelstart = 99;
      ruler          = false;
      list           = true;
      showtabline    = 1;
      winwidth       = 30;
      winminwidth    = 10;
      pumheight      = 15;
      helpheight     = 12;
      previewheight  = 12;
      showcmd        = false;
      cmdheight      = 2;
      cmdwinheight   = 5;
      equalalways    = false;
      laststatus     = 2;
      display        = "lastline";
      showbreak      = "↳  ";
      listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
      pumblend       = 10;
      winblend       = 10;
    }
  
    local bw_local  = {
      undofile       = true;
      synmaxcol      = 2500;
      formatoptions  = "1jcroql";
      textwidth      = 80;
      expandtab      = true;
      autoindent     = true;
      tabstop        = 2;
      shiftwidth    = 2;
      softtabstop    = -1;
      breakindentopt = "shift:2,min:20";
      wrap           = false;
      linebreak      = true;
      number         = true;
    --   colorcolumn    = "80";
      foldenable     = true;
      signcolumn     = "no";
      conceallevel   = 2;
      concealcursor  = "niv";
    }
  
    vim.g.python3_host_prog = '/usr/local/bin/python3'
    for name, value in pairs(global_local) do
      vim.o[name] = value
    end
    for k, v in pairs(bw_local) do
        if v == true or v == false then
          vim.cmd('set ' .. k)
        else
          vim.cmd('set ' .. k .. '=' .. v)
        end
    end
  end
  

load_options()

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
map('n', '<M-[>',':<c-u>put =repeat(nr2char(10), v:count1)<cr>')
map('n', '<M-]>',':<c-u>put! =repeat(nr2char(10), v:count1)<cr>')
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