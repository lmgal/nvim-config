require('mason-lspconfig').setup()

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tailwindcss" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.basedpyright.setup {
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
        useLibraryCodeForTypes = true
      }
    }
  },
  root_dir = function() return vim.loop.cwd() end,
}

vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja'
  }
}
lspconfig.jinja_lsp.setup {
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "htmldjango", "jinja" }
}

-- lspconfig.omnisharp.setup {
--   on_init = nvlsp.on_init,
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
--   root_dir = function() return vim.loop.cwd() end,
-- }

lspconfig.htmx.setup {
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  root_dir = function() return vim.loop.cwd() end,
}

lspconfig.intelephense.setup {
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  root_dir = function() return vim.loop.cwd() end,
  settings = {
    intelephense = {
      stubs = {
        "acf-pro",
        "acf-stubs",
        "wordpress",
        "wordpress-globals",
        -- "apache",
        -- "bcmath",
        -- "browscap",
        -- "bz2",
        -- "calendar",
        -- "com_dotnet",
        -- "Core",
        -- "ctype",
        -- "curl",
        -- "date",
        -- "dba",
        -- "dom",
        -- "enchant",
        -- "exif",
        -- "FFI",
        -- "fileinfo",
        -- "filter",
        -- "ftp",
        -- "gd",
        -- "gettext",
        -- "gmp",
        -- "hash",
        -- "iconv",
        -- "imap",
        -- "intl",
        -- "json",
        -- "ldap",
        -- "libxml",
        -- "mbstring",
        -- "mcrypt",
        -- "memcache",
        -- "memcached",
        -- "msgpack",
        -- "mysqli",
        -- "oci8",
        -- "odbc",
        -- "openssl",
        -- "pcntl",
        -- "pcre",
        -- "PDO",
        -- "pdo_ibm",
        -- "pdo_mysql",
        -- "pdo_pgsql",
        -- "pdo_sqlite",
        -- "pgsql",
        -- "Phar",
        -- "posix",
        -- "pspell",
        -- "readline",
        -- "recode",
        -- "Reflection",
        -- "session",
        -- "shmop",
        -- "SimpleXML",
        -- "snmp",
        -- "soap",
        -- "sockets",
        -- "sodium",
        -- "SPL",
        -- "sqlite3",
        -- "standard",
        -- "superglobals",
        -- "sybase_ct",
        -- "sysvmsg",
        -- "sysvsem",
        -- "sysvshm",
        -- "tidy",
        -- "tokenizer",
        -- "wddx",
        -- "xml",
        -- "xmlreader",
        -- "xmlrpc",
        -- "xmlwriter",
        -- "xsl",
        -- "Zend OPcache",
        -- "zip",
        -- "zlib",
      },
    },
  }
}

lspconfig.denols.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}


lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}
