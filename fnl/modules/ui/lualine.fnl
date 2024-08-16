(local options {:always_divide_middle true
       :component_separators {:left "" :right ""}
       :disabled_filetypes {:statusline {} :winbar {}}
       :globalstatus true
       :icons_enabled true
       :ignore_focus {}
       :refresh {:statusline 1000 :tabline 1000 :winbar 1000}
       :section_separators {:left "" :right ""}
       :theme :auto})	

(local icons (require :config.icons))

(λ border [padding]
   {1 (fn [] " ") :color {:fg ""} : padding :separator ""})

(fn file-name-component []
  (let [file-name (vim.fn.expand "%:t")
                  modified vim.bo.modified
                  file-icon "󰆓"
                  modified-highlight "lualine_c_diff_removed_normal"]
    (if modified (.. "%#" modified-highlight "#" file-icon " " file-name)
        file-name)))

(fn mode-component []
  (let [mode (vim.fn.mode)
             mode-map {"\022" :V-BLK
             :R :REP
             :V :V-LINE
             :c :CMD
             :i :INS
             :n :NOR
             :t :TERM
             :v :VIS}]

    (or (. mode-map mode) mode)))

(fn lsp-server-component []
  (let [clients (vim.lsp.get_active_clients)]
    (when (= (length clients) 0) (lua "return \" No LSP \""))
    (local last-client (. clients (length clients)))
    (.. icons.ui.Gear " " last-client.name)))

(fn git-branch-component []
  (let [handle (io.popen "git rev-parse --abbrev-ref HEAD 2>/dev/null")
               branch-name (: (handle:read :*a) :gsub "%s+" "")]
    (handle:close)
    (when (= branch-name "") (lua "return \"\""))
    (local branch-icon "")
    (local branch-highlight :lualine_b_normal)
    (.. "%#" branch-highlight "#" branch-icon " " branch-name)))

(local sections {:lualine_a [mode-component]
       :lualine_b [git-branch-component]
       :lualine_c [
                   (border {:right 1})
                   {1 :filetype
                   :icon {:align :right}
                   :padding 0
                   :icon_only true}
                   {1
                   file-name-component
                   :padding 0
                   }
                   :location
                   :progress
                   "diff"
                   ]
       :lualine_x [lsp-server-component "diagnostics"]
       :lualine_y []
       :lualine_z []})

[
 {1 "nvim-lualine/lualine.nvim"
 :dependencies ["nvim-tree/nvim-web-devicons"]
 :opts
 {:options options
 :sections sections}

 }]
