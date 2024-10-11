(local options {:always_divide_middle true
                :component_separators {:left "" :right ""}
                :disabled_filetypes {:statusline {} :winbar {}}
                :extensions ["lazy" "mason" "neo-tree"]
                :globalstatus true
                :icons_enabled true
                :ignore_focus {}
                :refresh {:statusline 1000 :tabline 1000 :winbar 1000}
                :section_separators {:left "" :right ""}
                :theme :auto})

(fn border [padding]
   {1 (fn [] " ") :color {:fg ""} : padding :separator ""})

(fn hide-in-width []
  (let [window-width-limit 100] (< vim.o.columns window-width-limit)))

(local hidden-filetypes [:aerial
                         :dapui_breakpoints
                         :dapui_console
                         :dapui_hover
                         :dapui_scopes
                         :dapui_stacks
                         :dapui_watches
                         :edgy
                         :harpoon
                         :neo-tree
                         :neo-tree-popup
                         :NeogitCommitSelectView
                         :NeogitCommitView
                         :NeogitConsole
                         :NeogitDiffView
                         :NeogitGitCommandHistory
                         :NeogitLogView
                         :NeogitPopup
                         :NeogitRebaseTodo
                         :Neogitreflogview
                         :Neogitrefsview
                         :NeogitStatus
                         :neotest-output-panel
                         :neotest-summary
                         :nvimtree
                         :overseerform
                         :overseerlist])

(fn file-name-component []
  (let [home (vim.fn.expand "~")]
    (var dir-path (: (vim.fn.system :pwd) :gsub "%s+" ""))
    (local file-name (vim.fn.bufname))
    (local modified-highlight :lualine_c_diff_removed_normal)
    (local file-icon "󰆓")
    (local current-filetype vim.bo.filetype)
    (when (and (= (vim.fn.empty file-name) 1) (= dir-path home))
      (lua "return \"~/\""))
    (if (= (vim.fn.empty file-name) 1)
        (do
          (when (= (dir-path:sub 1 (length home)) home)
            (set dir-path (.. "~" (dir-path:sub (+ (length home) 1)))))
          dir-path) (let [modified vim.bo.modified]
                     (var output nil)
                     (when (= (dir-path:sub 1 (length home)) home)
                       (set dir-path
                            (.. "~" (dir-path:sub (+ (length home) 1)))))
                     (set output (.. dir-path "/" file-name))
                     (when (hide-in-width)
                       (let [___antifnl_rtn_1___ (or (and modified
                                                          (.. "%#"
                                                              modified-highlight
                                                              "#"
                                                              file-icon
                                                              " "
                                                              (file-name:match "([^/]+)$")))
                                                     (file-name:match "([^/]+)$"))]
                         (lua "return ___antifnl_rtn_1___")))
                     (when (vim.tbl_contains hidden-filetypes
                                             current-filetype)
                       (let [___antifnl_rtn_1___ (or (and modified
                                                          (.. "%#"
                                                              modified-highlight
                                                              "#"
                                                              file-icon
                                                              " "
                                                              file-name))
                                                     file-name)]
                         (lua "return ___antifnl_rtn_1___")))
                     (or (and modified
                              (.. "%#" modified-highlight "#" file-icon
                                  " " output))
                         output)))))

(local hydra-statusline (require :hydra.statusline))

(fn hydra-component []
  (when (hide-in-width) (lua "return \"\""))
  (when (hydra-statusline.is_active)
    (local hydra-name (or (hydra-statusline.get_name) :Hydra))
    (let [___antifnl_rtn_1___ (.. "Hydra: " hydra-name)]
      (lua "return ___antifnl_rtn_1___")))
  "")

(fn mode-component []
  (let [mode (vim.fn.mode)
             mode-map {"\022" "V-BLK"
                       :R "REP"
                       :V "V-LINE"
                       :c "CMD"
                       :i "INS"
                       :n "NOR"
                       :s "SEA"
                       :t "TER"
                       :v "VIS"}]
    (or (. mode-map mode) mode)))

(fn lsp-server-component []
  (when (hide-in-width) (lua "return \"\""))
  (local clients (vim.lsp.get_active_clients))
  (local server-names {})
  (each [_ client (ipairs clients)] (table.insert server-names client.name))
  (if (= (length server-names) 0) " " (table.concat server-names ", ")))

(fn git-branch-component []
  (let [handle (io.popen "git rev-parse --abbrev-ref HEAD 2>/dev/null")
               branch-name (: (handle:read :*a) :gsub "%s+" "")]
    (handle:close)
    (when (= branch-name "") (lua "return \"\""))
    (local branch-icon "")
    (local branch-highlight :lualine_b_normal)
    (.. branch-icon " " branch-name)))

(fn has-file-opened []
  (and (not= vim.bo.filetype "") (not= (vim.fn.expand "%:p") "")))

(local sections {:lualine_a [mode-component]
                            :lualine_b {}
                                       :lualine_c [
                                                   (border {:right 1})
                                                   {1 :filetype
                                                      :icon {:align :right}
                                                      :padding 0
                                                      :icon_only true}
                                                   {1
                                                    file-name-component
                                                    :padding 0}

                                                   (border {:right 1})
                                                   {1
                                                    :location
                                                    :cond has-file-opened
                                                    :padding 0}

                                                   (border {:right 1})
                                                   {1
                                                    :progress
                                                    :cond has-file-opened
                                                    :padding 0}

                                                   (border {:right 1})
                                                   {1 :diff}]
                                         :lualine_x [hydra-component lsp-server-component {1 :diagnostics :always_visible false :sections ["error" "warn" "info"]} git-branch-component]
                                         :lualine_y {}
                                         :lualine_z {}})

[{1 "nvim-lualine/lualine.nvim"
    :opts
    {:options options
     :sections sections}}]
