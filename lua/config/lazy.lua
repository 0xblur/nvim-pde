--- Install lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup {
  spec = {
    { import = "base" },
    { import = "pde" },
  },
  -- Plugins are all lazy and latest commit.
  defaults = { lazy = true, version = false },
  -- Lazy will install plugins if missing.
  install = { missing = true, colorscheme = { "tokyonight", "catppuccin", "gruvbox" } },
  checker = { enabled = true },
  git = {
    log = { "-10" }, -- Show the last 10 commits
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
