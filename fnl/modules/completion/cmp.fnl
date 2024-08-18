[{1 :hrsh7th/nvim-cmp
  :config (fn []
            (local luasnip (require :luasnip))
            (local cmp (require :cmp))
            ((. (require :luasnip.loaders.from_vscode) :lazy_load))
            (local icons (require :config.icons))

            (fn has-words-before []
              (global unpack (or unpack table.unpack))
              (local (line col) (unpack (vim.api.nvim_win_get_cursor 0)))
              (and (not= col 0) (= (: (: (. (vim.api.nvim_buf_get_lines 0
                                                                        (- line
                                                                           1)
                                                                        line
                                                                        true)
                                            1)
                                         :sub col col)
                                      :match "%s")
                                   nil)))

            (local builtin
                   {:duplicates {:buffer 1 :luasnip 1 :nvim_lsp 0 :path 1}
                    :duplicates_default 0
                    :source_names {:buffer "(Buffer)"
                                   :calc "(Calc)"
                                   :cmp_tabnine "(Tabnine)"
                                   :copilot "(Copilot)"
                                   :emoji "(Emoji)"
                                   :luasnip "(Snippet)"
                                   :nvim_lsp "(LSP)"
                                   :path "(Path)"
                                   :tmux "(TMUX)"
                                   :treesitter "(TreeSitter)"
                                   :vsnip "(Snippet)"}})
            (local use-icons true)
            (cmp.setup {:formatting {:duplicates builtin.duplicates
                                     :duplicates_default builtin.duplicates_default
                                     :fields [:kind :abbr]
                                     :format (fn [entry vim-item]
                                               (local max-width 0)
                                               (when (and (not= max-width 0)
                                                          (> (length vim-item.abbr)
                                                             max-width))
                                                 (set vim-item.abbr
                                                      (.. (string.sub vim-item.abbr
                                                                      1
                                                                      (- max-width
                                                                         1))
                                                          icons.ui.Ellipsis)))
                                               (when use-icons
                                                 (set vim-item.kind
                                                      (. icons.kind
                                                         vim-item.kind))
                                                 (when (= entry.source.name
                                                          :copilot)
                                                   (set vim-item.kind
                                                        icons.git.Octoface)
                                                   (set vim-item.kind_hl_group
                                                        :CmpItemKindCopilot))
                                                 (when (= entry.source.name
                                                          :cmp_tabnine)
                                                   (set vim-item.kind
                                                        icons.misc.Robot)
                                                   (set vim-item.kind_hl_group
                                                        :CmpItemKindTabnine))
                                                 (when (= entry.source.name
                                                          :crates)
                                                   (set vim-item.kind
                                                        icons.misc.Package)
                                                   (set vim-item.kind_hl_group
                                                        :CmpItemKindCrate))
                                                 (when (= entry.source.name
                                                          :lab.quick_data)
                                                   (set vim-item.kind
                                                        icons.misc.CircuitBoard)
                                                   (set vim-item.kind_hl_group
                                                        :CmpItemKindConstant))
                                                 (when (= entry.source.name
                                                          :emoji)
                                                   (set vim-item.kind
                                                        icons.misc.Smiley)
                                                   (set vim-item.kind_hl_group
                                                        :CmpItemKindEmoji)))
                                               (set vim-item.menu
                                                    (. builtin.source_names
                                                       entry.source.name))
                                               (set vim-item.dup
                                                    (or (. builtin.duplicates
                                                           entry.source.name)
                                                        builtin.duplicates_default))
                                               vim-item)
                                     :kind_icons icons.kind
                                     :max_width 0
                                     :source_names builtin.source_names}
                        :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs (- 4))
                                                             :<C-e> (cmp.mapping.abort)
                                                             :<C-f> (cmp.mapping.scroll_docs 4)
                                                             :<C-o> (cmp.mapping.complete)
                                                             :<CR> (cmp.mapping.confirm {:select true})
                                                             :<S-Tab> (cmp.mapping (fn [fallback]
                                                                                     (if (cmp.visible)
                                                                                         (cmp.select_prev_item)
                                                                                         (luasnip.jumpable (- 1))
                                                                                         (luasnip.jump (- 1))
                                                                                         (fallback)))
                                                                                   [:i
                                                                                    :s])
                                                             :<Tab> (cmp.mapping (fn [fallback]
                                                                                   (if (cmp.visible)
                                                                                       (cmp.select_next_item)
                                                                                       (luasnip.expand_or_jumpable)
                                                                                       (luasnip.expand_or_jump)
                                                                                       (has-words-before)
                                                                                       (cmp.complete)
                                                                                       (fallback)))
                                                                                 [:i
                                                                                  :s])})
                        :snippet {:expand (fn [args]
                                            ((. (require :luasnip) :lsp_expand) args.body))}
                        :sources [{:max_item_count 3
                                   :name :copilot
                                   :trigger_characters [["."
                                                         ":"
                                                         "("
                                                         "'"
                                                         "\""
                                                         "["
                                                         ","
                                                         "#"
                                                         "*"
                                                         "@"
                                                         "|"
                                                         "="
                                                         "-"
                                                         "{"
                                                         "/"
                                                         "\\"
                                                         "+"
                                                         "?"
                                                         " "]]}
                                  {:entry_filter (fn [entry ctx]
                                                   (local kind
                                                          (. (. (require :cmp.types.lsp)
                                                                :CompletionItemKind)
                                                             (entry:get_kind)))
                                                   (when (and (= kind :Snippet)
                                                              (= ctx.prev_context.filetype
                                                                 :java))
                                                     (lua "return false"))
                                                   true)
                                   :name :nvim_lsp}
                                  {:name :conjure}
                                  {:name :path}
                                  {:name :luasnip}
                                  {:name :cmp_tabnine}
                                  {:name :nvim_lua}
                                  {:name :buffer}
                                  {:name :calc}
                                  {:name :emoji}
                                  {:name :treesitter}
                                  {:name :crates}
                                  {:name :tmux}]}))
  :dependencies [:hrsh7th/cmp-nvim-lsp
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip
                 :rafamadriz/friendly-snippets]}]
