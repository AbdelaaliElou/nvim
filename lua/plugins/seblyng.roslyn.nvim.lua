return {
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" }, -- Lazy load on C# and Razor files
    dependencies = {
      -- Optional: If you need razor-specific integrations (e.g. tris203/rzls.nvim)
    },
    config = function()
      require("roslyn").setup({
        args = {
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_filename()),
        },
        config = {
          -- Pass your custom on_attach and capabilities here if you use cmp or blink.cmp
          -- on_attach = my_on_attach,
          -- capabilities = my_capabilities,
          settings = {
            ["csharp|background_analysis"] = {
              -- Essential for large solutions to prevent memory leaks/crashes
              dotnet_analyzer_diagnostics_scope = "openFiles",
              dotnet_compiler_diagnostics_scope = "fullSolution",
            },
          },
        },
      })
    end,
  },
}
