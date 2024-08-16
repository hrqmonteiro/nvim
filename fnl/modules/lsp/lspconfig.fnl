[{1 :neovim/nvim-lspconfig
    :config (fn []
              (local servers (require :config.servers))
              (local lspconfig (require :lspconfig))
              (local capabilities (vim.lsp.protocol.make_client_capabilities))
              (each [_ server (ipairs servers)]
                ((. (. lspconfig server) :setup) {: capabilities
                                                 }))
              ((. (. (require :lspconfig) :metals) :setup) {})
              )}]

