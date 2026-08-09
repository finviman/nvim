-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""
vim.opt.relativenumber = false

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
