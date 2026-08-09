-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""
vim.opt.relativenumber = false
vim.g.snacks_animate = false

vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<D-v>", function()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { noremap = true, silent = true })

local function load_options()
  local global_local = {
    termguicolors = true,
    mouse = "nv",
    errorbells = true,
    visualbell = true,
    hidden = true,
    fileformats = "unix,mac,dos",
    magic = true,
    virtualedit = "block",
    encoding = "utf-8",
    fileencodings = "utf-8,cp936,gb18030,utf16le",
    viewoptions = "folds,cursor,curdir,slash,unix",
    sessionoptions = "curdir,help,tabpages,winsize",
    --   clipboard      = "unnamedplus";
    wildignorecase = true,
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    backup = false,
    writebackup = false,
    swapfile = false,
    history = 2000,
    shada = "!,'300,<50,@100,s10,h",
    backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    smarttab = true,
    shiftround = true,
    timeout = true,
    ttimeout = true,
    timeoutlen = 10,
    ttimeoutlen = 10,
    updatetime = 100,
    redrawtime = 1500,
    ignorecase = true,
    smartcase = true,
    infercase = true,
    incsearch = true,
    wrapscan = true,
    complete = ".,w,b,k",
    inccommand = "nosplit",
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --hidden --vimgrep --smart-case --",
    breakat = [[\ \	;:,!?]],
    startofline = false,
    whichwrap = "h,l,<,>,[,],~",
    splitbelow = true,
    splitright = true,
    switchbuf = "useopen",
    backspace = "indent,eol,start",
    diffopt = "filler,iwhite,internal,algorithm:patience",
    completeopt = "menuone,noselect",
    jumpoptions = "stack",
    showmode = false,
    shortmess = "aoOTIcF",
    scrolloff = 2,
    sidescrolloff = 5,
    foldlevelstart = 99,
    ruler = false,
    list = false,
    showtabline = 1,
    winwidth = 30,
    winminwidth = 10,
    pumheight = 15,
    helpheight = 12,
    previewheight = 12,
    showcmd = true,
    cmdheight = 1,
    cmdwinheight = 5,
    equalalways = false,
    laststatus = 2,
    display = "lastline",
    showbreak = "↳  ",
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    pumblend = 10,
    winblend = 10,
    cursorline = true,
  }

  local bw_local = {
    undofile = true,
    synmaxcol = 2500,
    formatoptions = "1jcroql",
    textwidth = 80,
    expandtab = true,
    autoindent = true,
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = -1,
    breakindentopt = "shift:2,min:20",
    nowrap = true,
    linebreak = true,
    number = true,
    --   colorcolumn    = "80";
    foldenable = true,
    signcolumn = "yes",
    conceallevel = 0,
    concealcursor = "niv",
  }

  vim.g.python3_host_prog = "/opt/homebrew/bin/python"
  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
  for k, v in pairs(bw_local) do
    if v == true or v == false then
      vim.cmd("set " .. k)
    else
      vim.cmd("set " .. k .. "=" .. v)
    end
  end
end

load_options()

if vim.g.neovide then
  vim.o.guifont = "JetbrainsMono Nerd Font:h17"
  vim.g.neovide_opacity = 0.95 -- 背景透明度 (0.0 ~ 1.0)
  vim.g.neovide_cursor_vfx_mode = "railgun" -- 光标粒子特效 ("railgun", "torpedo", "pixiedust" 等)
  vim.g.neovide_cursor_animation_length = 0.08 -- 光标移动动画时长
  vim.g.neovide_remember_window_size = true -- 记住上一次窗口大小
  vim.g.neovide_confirm_quit = true -- 退出时确认
  vim.g.neovide_input_macos_alt_is_meta = "both" -- macOS 专享：将 Option/Alt 键映射为 Meta
  local function save()
    vim.cmd.write()
  end
  local function copy()
    vim.cmd([[normal! "+y]])
  end
  local function paste()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end

  vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
  vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
end
