-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "clangd", "--background-index", "--clang-tidy" }, -- Optional: enable clang-tidy for linting
  filetypes = { "cpp", "c", "objc", "objcpp" },  -- Supported C/C++/Objective-C filetypes
  root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),  -- Look for a `compile_commands.json` or `.git` folder to determine the project root
  settings = {
    clangd = {
      diagnostics = {
        enable = true,  -- Enable diagnostics (errors/warnings)
      }
    }
  }
}
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    javascript = {
      format = { 
        enable = true,  -- Enable formatting for JavaScript
      }
    },
    typescript = {
      format = {
        enable = true,  -- Enable formatting for TypeScript
      }
    }
  }
}
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",  -- You can change to "strict" for more detailed type checks
        diagnosticMode = "workspace", -- Enable diagnostics for the whole workspace
      }
    }
  }
}
-- Configure Java (jdtls)
lspconfig.jdtls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "jdtls" },  -- Ensure this is the correct path to jdtls if it's not in your PATH
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),  -- Look for common Java project files
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",  -- Interactively choose build tool configuration (e.g., Maven, Gradle)
      }
    }
  },
}
lspconfig.dartls.setup{
  cmd = {"dart", "language-server"},
  filetypes = {"dart"},
  root_dir = lspconfig.util.root_pattern(".git", "pubspec.yaml"),
  settings = {
    dart = {
      completeFunctionCalls = true,
    },
  },
}
