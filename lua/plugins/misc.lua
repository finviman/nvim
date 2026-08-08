-- lua/plugins/flash.lua
return {
  {
    "folke/flash.nvim",
    keys = {
      -- 1. 将 flash 默认抢占的原生按键禁用掉（设为 false 即可恢复原生 s / S 替换功能）
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },

      -- 2. （可选）如果你想给 Flash 留一个比 <leader>bs 更短的单按键入口，
      -- 比如映射给 'gz' 或者都不绑，完全随你：
      -- { "gz", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
    },
  },

  { "glepnir/zephyr-nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zephyr", -- 👈 填真正的名字
    },
  },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end,
  },
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
}
