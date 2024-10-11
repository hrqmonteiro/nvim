;; This file controls which packages are loaded by lazy.vim, and which languages Mason will download the respective language servers, and lspconfig
;; will load and config them.
;; Any package or language that you want loaded, leave it uncommented, those you don't want to use, comment it.
;; Some support flags, which have the following syntax: [package/language-name +flag], example: [go +templ], this will load go language server and also templ.

(import-macros {: modules!} :macros)

(modules!
  :completion
  cmp
  telescope

  :editor
  ;leap
  ;;multiple-cursors
  ;parinfer
  tangerine

  :term
  ;toggleterm

  :lang
  ;bash
  ;cc
  ;css
  ;clojure
  ;;crystal
  ;;[dart +flutter]
  ;[docker +compose]
  ;;elixir
  ; fennel
  ;[go +templ]
  ;;graphql
  ;;haskell
  ;;[html +emmet +htmx +xml]
  ;json
  ;;[java +groovy]
  ;;kotlin
  ;;latex
  ;lua
  ;;[markdown +mdx]
  ;;nim
  ;;nix
  ;;ocaml
  ;;org
  ;php
  ;;python
  ;;ruby
  ;;rust
  ;;scala
  ;;solidity
  ;;sql
  ;;swift
  ;tailwindcss
  ;;toml
  [typescript
    +angular
    +astro
    +eslint
    +prisma
    +svelte
    +vue]
  ;yaml
  ;;zig

  :lsp
  lspconfig
  mason
  ;;nvim-lightbulb

  :nvim
  ;;oil
  plenary

  :tools
  ; conjure
  ;colorizer
  ;editorconfig
  ;fugitive
  ;lazygit
  ;[neogit +diffview]
  ;neorg
  ;[orgmode +bullets +headlines]
  ; paperplanes
  ;tmux-navigator
  treesitter

  :ui
  ;alpha
  ;auto-dark-mode
  colorscheme
  ;;dressing
  gitsigns
  hydra
  ;;illuminate
  ;image
  ;indent-lines
  lualine
  mini-icons
  ; neodim
  ;; neoscroll
  neo-tree
  ;;noice
  ;; pqf                            ;; Pretty quick fix window.  
  ; smoothie
  ;tint
  ; todo-comments
  ;trouble
  ;;visual-whitespace
  which-key)
  ; zen)
