return {

  -- Comment lines of code in visual mode with "gc" for linewise comments or "gb" for blockwise comments.
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      local opts = {
        ignore = "^$",                                                                              -- Ignore empty lines (regex).
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(), -- TypeScript support
      }
      require("Comment").setup(opts)
    end,
  },
  -- Extend % to keywords
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
