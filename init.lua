require("config.lazy")






-- Expand your home directory path dynamically
local home = vim.fn.expand("$HOME")

local system_paths = {
  "/usr/local/go/bin",                                -- Your Go location
  home .. "/.nvm/versions/node/v24.20.0/bin",         -- Your EXACT NVM Node & NPM location
  "/usr/bin",                                         -- Python3, g++, curl, etc.
  "/bin",
  "/usr/local/bin",
  home .. "/.local/share/nvim/mason/bin",             -- Mason binaries folder
}

-- Stitch paths together and prepend to Neovim's environment
vim.env.PATH = table.concat(system_paths, ":") .. ":" .. vim.env.PATH
