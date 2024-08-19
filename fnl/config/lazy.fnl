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
    (each [category modules (pairs map)]
      (each [_ module (ipairs modules)]
        (table.insert spec {:import (.. :modules. category "." module)})))
    spec))
(lazy.setup {:spec (create-spec-from-map modules)})
