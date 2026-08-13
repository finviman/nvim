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
  {
    "folke/snacks.nvim",
    opts = {
      -- 将 dashboard 模块设为 disabled 即可彻底关闭启动主页
      dashboard = {
        enabled = false,
      },
    },
  },
  -- 1. 配置 LSP：同时启动 ruff 和 basedpyright，并屏蔽 basedpyright 的重复诊断
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          init_options = {
            settings = {
              -- 这里可以传 ruff 的命令行参数，例如指定的规则集
              args = {},
            },
          },
        },
        -- basedpyright 负责深度静态类型检查
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic", -- 可选: "off", "basic", "strict"
                -- 关掉 basedpyright 内置的废弃/未使用变量提示，全部交给 Ruff
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "none",
                  reportUnusedVariable = "none",
                },
              },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        json = { "jq" },
        jsonc = { "jq" },
      },
    },
  },
}
