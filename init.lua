require'plugins.init'
require'plugins.config'
require'mappings'

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
      fileencodings  = "utf-8,cp936,gb18030,utf16le";
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
      timeoutlen     = 10;
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
      list           = false;
      showtabline    = 1;
      winwidth       = 30;
      winminwidth    = 10;
      pumheight      = 15;
      helpheight     = 12;
      previewheight  = 12;
      showcmd        = true;
      cmdheight      = 2;
      cmdwinheight   = 5;
      equalalways    = false;
      laststatus     = 2;
      display        = "lastline";
      showbreak      = "↳  ";
      listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
      pumblend       = 10;
      winblend       = 10;
      cursorline     = true;
    }

    local bw_local  = {
      undofile       = true;
      synmaxcol      = 2500;
      formatoptions  = "1jcroql";
      textwidth      = 80;
      expandtab      = true;
      autoindent     = true;
      tabstop        = 2;
      shiftwidth     = 2;
      softtabstop    = -1;
      breakindentopt = "shift:2,min:20";
      nowrap         = true;
      linebreak      = true;
      number         = true;
    --   colorcolumn    = "80";
      foldenable     = true;
      signcolumn     = "yes";
      conceallevel   = 0;
      concealcursor  = "niv";
    }

    vim.g.python3_host_prog = '/usr/bin/python3'
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
