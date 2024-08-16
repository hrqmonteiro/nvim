(require-macros :config.macros)

[{1 "mhartington/formatter.nvim"
  :config (fn []
            (local formatter (require :formatter))
            (local formatters {})

            (fn formatters.fnlfmt []
              "The fennel formatter"
              {:exe :fnlfmt :args [(vim.api.nvim_buf_get_name 0)] :stdin true})

            (formatter.setup {:filetype {:fennel [formatters.fnlfmt]}}))}]
