(fn get-nvim-directory [] (.. (os.getenv :HOME) :/.config/nvim))
(fn read-servers-from-file [file-path]
  (let [servers {}
        file (io.open file-path :r)]
    (when (not file)
      (let [___antifnl_rtn_1___ {}] (lua "return ___antifnl_rtn_1___")))
    (local content (file:read :*a))
    (file:close)
    (local (chunk load-err) (load content))
    (when (not chunk)
      (let [___antifnl_rtn_1___ {}] (lua "return ___antifnl_rtn_1___")))
    (local (ok result) (pcall chunk))
    (if (and ok (= (type result) :table)) result {})))
(fn process-files [dir patterns servers]
  (let [nvim-dir (get-nvim-directory)
        command (.. "find \"" nvim-dir "/" dir
                    "\" -maxdepth 1 -name \"init.lua\" 2>/dev/null")
        p (io.popen command)
        files (p:read :*a)]
    (p:close)
    (each [file (files:gmatch "[^\r\n]+")]
      (local file-servers (read-servers-from-file file))
      (each [_ server (ipairs file-servers)] (table.insert servers server)))))
(fn process-subdirectories [base-path lang patterns servers]
  (let [nvim-dir (get-nvim-directory)]
    (each [_ pattern (ipairs patterns)]
      (when (pattern:match (.. "^" lang "%..+"))
        (local subdir (pattern:match (.. "^" lang "%.(.+)")))
        (when subdir (local subdir-path (.. base-path "/" lang "/" subdir))
          (process-files subdir-path {} servers))))))
(fn setup-lspconfig []
  (let [modules (require :modules)
        lang-folders (or modules.lang {})
        servers {}]
    (each [_ lang (ipairs lang-folders)]
      (local base-path :lua/modules/lang)
      (local lang-path (.. base-path "/" lang))
      (local patterns {})
      (each [_ pat (ipairs lang-folders)] (table.insert patterns pat))
      (process-files lang-path patterns servers)
      (process-subdirectories base-path lang lang-folders servers))
    (local seen {})
    (local unique-servers {})
    (each [_ server (ipairs servers)]
      (when (not (. seen server)) (tset seen server true)
        (table.insert unique-servers server)))
    (local lspconfig (require :lspconfig))
    (local capabilities (vim.lsp.protocol.make_client_capabilities))
    (each [_ server (ipairs unique-servers)]
      ((. (. lspconfig server) :setup) {: capabilities}))))
[{1 :neovim/nvim-lspconfig :config setup-lspconfig}]
