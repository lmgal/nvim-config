local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    htmldjango = { "djlint" },
    jinja = { "djlint" },
    jsx = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    php = {
      command = "php-cs-fixer",
      args = {
        "fix",
        "--rules=@PSR12",
        "$FILENAME",
      },
      stdin = false
    }
  },
  default_format_opts = {
    timeout_ms = 10000,
    lsp_format = "fallback"
  }
}

return options
