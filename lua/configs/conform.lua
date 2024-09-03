local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    htmldjango = { "prettier" },
    jsx = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
  },
  default_format_opts = {
    timeout_ms = 5000,
    lsp_format = "fallback"
  }
 }

return options
