(local map vim.keymap.set)
(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")

(map :n :<Leader><CR> ":Telescope bookmarks list<CR>"
     {:desc "Jump to bookmark"})
(map :n :<Leader><Leader> ":Telescope find_files<CR>"
     {:desc "Find file in project"})
(map :n "<Leader>'" ":Telescope live_grep<CR>" {:desc "Resume last search"})
(map :n :<Leader>* ":Telescope symbols<CR>"
     {:desc "Search for symbol in project"})
(map :n "<Leader>," ":Telescope buffers<CR>" {:desc "Switch workspace buffer"})
(map :n :<Leader>. ":Telescope find_files<CR>" {:desc "Find file"})
(map :n :<Leader>/ ":Telescope live_grep<CR>" {:desc "Search project"})
(map :n "<Leader>:" ":" {:desc :CMD})
(map :n "<Leader>;" ":" {:desc "Eval Expression"})
(map :n :<Leader>< ":Telescope buffers<CR>" {:desc "Switch buffer"})
(map :n "<Leader>`" ":" {:desc "Switch to last buffer"})
(map :n "<Leader>q" vim.diagnostic.goto_next {:desc "Diagnostic loclist"})
(map :n "<Esc>" ":noh<CR>" {:silent true})

(local showtabline-value (vim.api.nvim_get_option :showtabline))

(local wk (require :which-key))
(local bm (require :bookmarks))

(wk.add [{1 :<Leader><Tab> :group :workspace}
         {1 :<Leader><Tab><Tab>
          2 (string.format ":set showtabline=%d<CR>"
                           (or (and (= showtabline-value 2) 0) 2))
          :desc "Toggle tab bar display"}
         {1 :<Leader>b :group :buffer}
         {1 "<Leader>b[" 2 ":bprevious<CR>" :desc "Previous buffer"}
         {1 "<Leader>b]" 2 ":bnext<CR>" :desc "Next buffer"}
         {1 :<Leader>bd 2 ":bdelete<CR>" :desc "Kill buffer"}
         {1 :<Leader>bi 2 ":JABSOpen<CR>" :desc :JABS}
         {1 :<Leader>bk 2 ":bdelete<CR>" :desc "Kill buffer"}
         {1 :<Leader>bl 2 ":blast<CR>" :desc "Switch to last buffer"}
         {1 :<Leader>bM 2 bm.bookmark_ann :desc "Edit bookmark"}
         {1 :<Leader>bm 2 bm.bookmark_toggle :desc "Set bookmark"}
         {1 :<Leader>bn 2 ":bnext<CR>" :desc "Next buffer"}
         {1 :<Leader>bp 2 ":bprevious<CR>" :desc "Previous buffer"}
         {1 :<Leader>c :group :code}
         {1 :<Leader>ca
          2 vim.lsp.buf.code_action
          :desc "LSP Execute code actions"}
         {1 :<Leader>cD 2 vim.lsp.buf.references :desc "Jump to references"}
         {1 :<Leader>cd 2 vim.lsp.buf.definition :desc "Jump to definition"}
         {1 :<Leader>cf 2 vim.lsp.buf.format :desc "Format buffer/region"}
         {1 :<Leader>ci
          2 vim.lsp.buf.implementation
          :desc "Find implementations"}
         {1 :<Leader>ck 2 vim.lsp.buf.hover :desc "Hover documentation"}
         {1 :<Leader>cr 2 vim.lsp.buf.rename :desc "LSP Rename"}
         {1 :<Leader>cS 2 vim.lsp.buf.document_symbol :desc :Symbols}
         {1 :<Leader>ct
          2 vim.lsp.buf.type_definition
          :desc "Find type definition"}
         {1 :<Leader>cx 2 ":TroubleToggle<CR>" :desc "List errors (Trouble)"}
         {1 :<Leader>f :group :file}
         {1 :<Leader>ff 2 ":Telescope find_files<CR>" :desc "Find file"}
         {1 :<Leader>fr 2 ":Telescope oldfiles<CR>" :desc "Recent files"}
         {1 :<Leader>fw 2 ":Telescope live_grep<CR>" :desc "Live grep"}
         {1 :<Leader>g :group :git}
         {1 "<Leader>g[" 2 ":Gitsigns next_hunk<CR>" :desc "Jump to next hunk"}
         {1 "<Leader>g]"
          2 ":Gitsigns prev_hunk<CR>"
          :desc "Jump to previous hunk"}
         {1 :<Leader>gB
          2 ":Gitsigns blame_line<CR>"
          :desc "Git blame (Gitsigns)"}
         {1 :<Leader>gb
          2 ":Telescope git_branches<CR>"
          :desc "Git switch branch (Telescope)"}
         {1 :<Leader>gD 2 ":G rm %<CR>" :desc "Git file delete (Fugitive)"}
         {1 :<Leader>gF 2 ":G fetch<CR>" :desc "Git fetch (Fugitive)"}
         {1 :<Leader>gg 2 ":Neogit<CR>" :desc "Neogit status"}
         {1 :<Leader>gL 2 ":G log<CR>" :desc "Git log (Fugitive)"}
         {1 :<Leader>gR
          2 ":G checkout HEAD~ %<CR>"
          :desc "Revert file (Fugitive)"}
         {1 :<Leader>gr
          2 ":Gitsigns reset_hunk<CR>"
          :desc "Reset hunk at point"}
         {1 :<Leader>gS
          2 ":G add %<CR>"
          :desc "Git stage this file (Fugitive)"}
         {1 :<Leader>gs
          2 ":Gitsigns stage_hunk<CR>"
          :desc "Stage hunk at point"}
         {1 :<Leader>gU
          2 ":G reset %<CR>"
          :desc "Git unstage this file (Fugitive)"}
         {1 :<Leader>h :group :help}
         {1 :<Leader>ht
          2 ":Telescope colorscheme<CR>"
          :desc "Change colorscheme"}
         {1 :<Leader>i :group :insert}
         {1 :<Leader>ie 2 ":Telescope emoji<CR>" :desc :Emoji}
         {1 :<Leader>l :group :lsp}
         {1 :<Leader>lf
          2 vim.diagnostic.open_float
          :desc "Floating diagnostics"}
         {1 :<Leader>o :group :open}
         {1 :<Leader>o- 2 ":Oil<CR>" :desc :Oil}
         {1 :<Leader>op 2 ":Neotree toggle<CR>" :desc "Project sidebar"}
         {1 :<Leader>ot 2 ":ToggleTerm<CR>" :desc "Toggle terminal"}
         {1 :<Leader>p :group :project}
         {1 :<Leader>pp 2 ":Telescope projects<CR>" :desc "Switch project"}
         {1 :<Leader>t :group :toggle}
         {1 :<Leader>tb
          2 ":Gitsigns toggle_current_line_blame<CR>"
          :desc "Current line blame"}
         {1 :<Leader>tf 2 ":TZFocus<CR>" :desc "Focus mode"}
         {1 :<Leader>ti 2 ":IBLToggle<CR>" :desc "Indent lines"}
         {1 :<Leader>tl 2 ":set norelativenumber nu!<CR>" :desc "Line numbers"}
         {1 :<Leader>tm 2 ":TZMinimalist<CR>" :desc "Minimalist mode"}
         {1 :<Leader>tr 2 ":set number rnu!<CR>" :desc "Relative line numbers"}
         {1 :<Leader>tz 2 ":TZAtaraxis<CR>" :desc "Zen mode"}]
        {:silent true})
