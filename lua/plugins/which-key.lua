-- lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  opts = {
    preset = "classic",
    win = {
      border = "single",
    },
    spec = {
      -- 1. 退出与基础
      { "<leader>Q", "<cmd>qa!<cr>", desc = "quit-no-save" },
      { "<leader>q", "<cmd>q<cr>", desc = "quit" },

      -- 2. Buffer 管理 (兼容 LazyVim bufferline / snacks)
      { "<leader>b", group = "Buffer" },
      { "<leader>bD", "<cmd>BufferLineCloseOthers<cr>", desc = "kill-other-buffers" },
      { "<leader>b[", "<cmd>bprevious<cr>", desc = "previous-buffer" },
      { "<leader>b]", "<cmd>bnext<cr>", desc = "next-buffer" },
      {
        "<leader>bb",
        function()
          LazyVim.pick("buffers")()
        end,
        desc = "buffer list",
      },
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "kill-buffer",
      },
      {
        "<leader>bs",
        function()
          require("flash").jump()
        end,
        desc = "easy motion",
      },

      -- 3. Code (LSP / 诊断 / 格式化)
      { "<leader>c", group = "Code" },
      { "<leader>cR", vim.lsp.buf.rename, desc = "rename symbol" },
      {
        "<leader>c[",
        function()
          vim.diagnostic.jump({ count = -1 })
        end,
        desc = "pre diagnostics",
      },
      {
        "<leader>c]",
        function()
          vim.diagnostic.jump({ count = 1 })
        end,
        desc = "next diagnostics",
      },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "code action" },
      {
        "<leader>cc",
        function()
          vim.diagnostic.open_float()
        end,
        desc = "show diagnostics",
      },
      {
        "<leader>cd",
        function()
          LazyVim.pick("lsp_definitions")()
        end,
        desc = "to definition",
      },
      { "<leader>ce", "<cmd>!python %<cr>", desc = "Run Python!" },
      {
        "<leader>cf",
        function()
          LazyVim.format({ force = true })
        end,
        desc = "format code",
      },
      { "<leader>ch", vim.lsp.buf.hover, desc = "code doc" },
      {
        "<leader>ci",
        function()
          LazyVim.pick("lsp_implementations")()
        end,
        desc = "to implementation",
      },
      {
        "<leader>cr",
        function()
          LazyVim.pick("lsp_references")()
        end,
        desc = "to reference",
      },
      {
        "<leader>cs",
        function()
          LazyVim.pick("lsp_symbols")()
        end,
        desc = "symbols finder",
      },
      {
        "<leader>ct",
        function()
          LazyVim.pick("treesitter")()
        end,
        desc = "tag list",
      },

      -- 4. Debug (DAP 调试)
      { "<leader>d", group = "Debug" },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "toggle breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "start/continue",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "DapUi",
      },

      -- 5. Edit
      { "<leader>e", group = "Edit" },
      { "<leader>et", "<cmd><cr>", desc = "text align" },

      -- 6. Files (替换 NvimTree 为 LazyVim 原生的 Neo-Tree)
      { "<leader>f", group = "Files" },
      { "<leader>fS", "<cmd>wa<cr>", desc = "save all" },
      { "<leader>fd", "<cmd>lua Ranger_toggle()<cr>", desc = "ranger" },
      {
        "<leader>ff",
        function()
          LazyVim.pick("files")()
        end,
        desc = "project file list",
      },
      {
        "<leader>fg",
        function()
          LazyVim.pick("git_files")()
        end,
        desc = "git repo file list",
      },
      { "<leader>fl", "<cmd>checktime<cr>", desc = "load new change" },
      {
        "<leader>fr",
        function()
          LazyVim.pick("oldfiles")()
        end,
        desc = "history files",
      },
      { "<leader>fs", "<cmd>w<cr>", desc = "save file" },
      {
        "<leader>ft",
        function()
          Snacks.explorer()
        end,
        desc = "file-tree",
      },
      { "<leader>fw", "<cmd>w !sudo tee %<cr><cr>", desc = "sudo write" },

      -- 7. Git (利用 LazyVim 极其强大的 Git 增强工具链)
      { "<leader>g", group = "Git" },
      {
        "<leader>g/",
        function()
          LazyVim.pick("live_grep")()
        end,
        desc = "search in git files",
      },
      { "<leader>g<", "<cmd>diffget<cr>", desc = "diffget" },
      { "<leader>g>", "<cmd>diffput<cr>", desc = "diffput" },
      {
        "<leader>g[",
        function()
          require("gitsigns").nav_hunk("prev")
        end,
        desc = "previous changed chunk",
      },
      {
        "<leader>g]",
        function()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "next changed chunk",
      },
      {
        "<leader>gb",
        "<cmd>BlameToggle<cr>",
        desc = "git blame",
      },
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "git diff --cached" },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "lazygit",
      },
      {
        "<leader>go",
        function()
          LazyVim.pick("git_branches")()
        end,
        desc = "git branch list",
      },
      {
        "<leader>gr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "revert current change",
      },
      {
        "<leader>gs",
        function()
          LazyVim.pick("git_status")()
        end,
        desc = "git status",
      },

      -- 8. Projects & Codebase 搜索（保持你的 /home/yli/Program/github/ 绝对路径）
      { "<leader>p", group = "Projects" },
      {
        "<leader>p/",
        function()
          LazyVim.pick("live_grep", { cwd = "/Users/liyang/Program" })()
        end,
        desc = "find string in codebase",
      },
      {
        "<leader>pD",
        function()
          LazyVim.pick("grep_string", { cwd = "/Users/liyang/Program" })()
        end,
        desc = "cursor word in codebase",
      },
      {
        "<leader>pd",
        function()
          LazyVim.pick("grep_string")()
        end,
        desc = "cursor word in project",
      },
      {
        "<leader>pf",
        function()
          LazyVim.pick("files", { cwd = "/Users/liyang/Program/github" })()
        end,
        desc = "files in codebase",
      },
      {
        "<leader>pl",
        function()
          Snacks.explorer.reveal()
        end,
        desc = "locate file in FileTree",
      },
      {
        "<leader>ps",
        function()
          LazyVim.pick("projects")()
        end,
        desc = "switch projects",
      },

      -- 9. Toggle
      { "<leader>t", group = "Toggle" },
      { "<leader>tc", "<cmd>lua Colorcolumn_toggle()<cr>", desc = "color column 80" },
      {
        "<leader>tf",
        function()
          Snacks.explorer()
        end,
        desc = "File Tree",
      },
      { "<leader>tl", "<cmd>set list!<cr>", desc = "nonvisual char" },
      { "<leader>tr", "<cmd>set relativenumber!<cr>", desc = "relativenumber" },
      {
        "<leader>ts",
        function()
          Snacks.terminal()
        end,
        desc = "shell/terminal",
      },
      { "<leader>tw", "<cmd>set wrap!<cr>", desc = "line wrap" },

      -- 10. Vim / Config 快速操作
      { "<leader>v", group = "Vim" },
      { "<leader>vS", "<cmd>source $MYVIMRC<cr>", desc = "load config" },
      {
        "<leader>va",
        function()
          LazyVim.pick("commands")()
        end,
        desc = "action commands",
      },
      {
        "<leader>vc",
        function()
          LazyVim.pick("command_history")()
        end,
        desc = "command history",
      },
      {
        "<leader>ve",
        function()
          LazyVim.pick("files", { cwd = vim.fn.stdpath("config") })()
        end,
        desc = "init.nvim / Config",
      },
      {
        "<leader>vf",
        function()
          LazyVim.pick("filetypes")()
        end,
        desc = "filetypes",
      },
      {
        "<leader>vh",
        function()
          LazyVim.pick("help")()
        end,
        desc = "help tags",
      },
      {
        "<leader>vm",
        function()
          LazyVim.pick("marks")()
        end,
        desc = "marks",
      },
      {
        "<leader>vr",
        function()
          LazyVim.pick("registers")()
        end,
        desc = "registers",
      },
      {
        "<leader>vs",
        function()
          LazyVim.pick("search_history")()
        end,
        desc = "search history",
      },
      {
        "<leader>vt",
        function()
          LazyVim.pick("colorschemes")()
        end,
        desc = "colorschemes",
      },

      -- 11. Windows 窗口管理
      { "<leader>w", group = "Windows" },
      { "<leader>w=", "<C-W>=", desc = "balance-window" },
      { "<leader>wH", "<C-W>8<", desc = "expand-window-left" },
      { "<leader>wJ", "<cmd>resize +5<cr>", desc = "expand-window-below" },
      { "<leader>wK", "<cmd>resize +5<cr>", desc = "expand-window-up" },
      { "<leader>wL", "<C-W>8>", desc = "expand-window-right" },
      { "<leader>wd", "<C-W>q", desc = "close window" },
      { "<leader>wh", "<C-W>h", desc = "window-left" },
      { "<leader>wj", "<C-W>j", desc = "window-below" },
      { "<leader>wk", "<C-W>k", desc = "window-up" },
      { "<leader>wl", "<C-W>l", desc = "window-right" },
      { "<leader>wm", "<C-W>|<C-W>_", desc = "maximum-window" },
      { "<leader>ws", "<C-W>s", desc = "split-window-below" },
      { "<leader>wv", "<C-W>v", desc = "split-window-right" },
      { "<leader>wx", "<C-W>x", desc = "swap 2 windows" },
    },
  },
}
