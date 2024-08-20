(import-macros {: packages!} :macros)

(packages!
  :completion
    cmp
    [telescope +native]

  :editor
    parinfer
    tangerine
  
  :term
    toggleterm

  :lang
    bash
    ;cc
    css
    clojure
    ;crystal
    ;[dart +flutter]
    [docker +compose]
    ;elixir
    fennel
    [go +templ]
    graphql
    ;haskell
    [html +emmet +htmx +xml]
    json
    ;java
    ;kotlin
    ;latex
    lua
    [markdown +mdx]
    ;nim
    ;nix
    ;ocaml
    ;php
    ;python
    ;ruby
    rust
    ;scala
    ;solidity
    sql
    ;swift
    tailwindcss
    toml
    [typescript +angular +astro +eslint +prisma +svelte +vue]
    yaml
    ;zig

  :lsp
    lspconfig
    mason
    nvim-lightbulb

  :tools
    conjure
    colorizer
    editorconfig
    [neogit +octo]
    neorg
    tmux-navigator
    treesitter

  :ui
    alpha
    auto-dark-mode
    colorscheme
    gitsigns
    hydra
    indent-lines
    lualine
    neo-tree
    noice
    todo-comments
    web-devicons
    which-key)
