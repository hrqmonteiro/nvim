(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(when (not (vim.loop.fs_stat lazypath))
  (vim.fn.system [:git
                  :clone
                  "--filter=blob:none"
                  :--single-branch
                  "https://github.com/folke/lazy.nvim.git"
                  lazypath]))
(vim.opt.runtimepath:prepend lazypath)
(local lazy (require :lazy))
(local modules (require :packages))
(fn create-spec-from-map [map]
  (let [spec {}]
    (fn should-include [module]
      (not (or (module:match "^modules%.lang") (module:match "^modules%.config"))))

    (each [category modules0 (pairs map)]
      (each [_ module (ipairs modules0)]
        (local module-name (.. :modules. category "." module))
        (var full-path nil)
        (when (should-include module-name)
          (if (module:find "/")
              (let [parts (vim.split module "/")
                    dir (table.concat parts "." 1 (- (length parts) 1))
                    file (. parts (length parts))]
                (set full-path (.. dir "." file)))
              (set full-path module-name))
          (table.insert spec {:import full-path}))))
    spec))
(lazy.setup {:spec (create-spec-from-map modules)})
