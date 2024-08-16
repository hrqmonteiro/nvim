[{1 :williamboman/mason.nvim
  :config (fn []
            (local servers (require :config.servers))
            (local tools (require :config.tools))
            ((. (require :mason) :setup))
            ((. (require :mason-lspconfig) :setup) {:ensure_installed servers})
            ((. (require :mason-tool-installer) :setup) {:ensure_installed tools}))
  :dependencies [:williamboman/mason-lspconfig.nvim
                 :WhoIsSethDaniel/mason-tool-installer.nvim]}]
