# Judah's Neovim Configuration

This repository contains the Neovim configuration I use on a day-to-day basis. 
Please note this includes a lot of custom shortcuts. This was originally forked from [this repo](https://github.com/craftzdog/dotfiles-public/tree/master).

## Features

This config contains the following plugins:

- Packer: plugin management
- LSP: Language Server Protocol 
- Mason: language server management for linting, formatting etc.
- Telescope: File browsing, fuzzy search through repository etc.
- Git-signs and Fugitive for Git integration.
- DAP: Debug adapter Protocol
- Undo-Tree: View undo tree.
- Various other useful plugins.

## Installation

This guide is made for MacOS specifically, but the config can work on Windows/Linux too. If homebrew is not installed, [install it](https://brew.sh/).

First install Neovim (>= 0.8).

```bash
> brew install neovim
```

Install all requirements:
```sh
# General Requirements
> brew install tree-sitter lua-lanugage-server prettier texlab ripgrep asciidoctor fzf
```
Clone this repository somewhere safe. 

```bash
> git clone https://github.com/judah-daniels/nvim
```

Run `dev` to link `~/.config/nvim/` to the cloned repo.

You may wish to instead first fork this repository, then clone your fork.

## Key-Bindings

Don't worry about learning all of these. I'd recommend just using a few to begin with, and having a look every now and then to explore some new features. 

#### General
- `ss`: Split window horizontally.
- `sv`: Split window vertically.
- `<Space>`: Cycle between opened windows.
- `s{h,j,k,l}`: Move between opened windows.
- `<C-w>q`: Close a window.

#### Language Server Bindings

- `K`: Show LSP info for the current token. Shows type, doc string etc.
- `[d`: Go to previous error/ warning.
- `]d`: Go to next error/ warning.
- `go`: Go to type definition.
- `gd`: Go to definition.
- `gD`: Go to declaration.
- `gr`: Show all references to the current token.
- `,ca`: List possible code actions (e.g. automatic error fixes).
- `,rn`: Rename the selected token.
- `,f`: Format the current file.

#### Git 

- `,g`: Open Git window. This provides a git status-like view, and allows files to be staged or unstaged. The following bindings apply within the git window:
    - `s`: Stage file
    - `u`: Unstage file
    - `=`: Toggle inline diff of file under cursor.
    - `cc`: Commit staged files. Type the commit message in the new window and then run `:q`.
    - `P`: Invokes `git add -patch` for the selected file.
    - `g?`: Show help.

#### Exploring 

- `sf`: Show File browser. 
    - `Enter` to open a folder/file.
    -  Navigate with `j` and `k`. 
- `;f`: Open "Git Files". 
    - Allows [fuzzy-finding](https://github.com/junegunn/fzf) of any file in the current git repo. 
    - *This is really useful!* It allows you to open any file in your project instantly.
- `;b`: Open Recent Buffers. 
    - Allows you to select any file that has been opened since starting Neovim.
- `;r`: [Ripgrep](https://github.com/BurntSushi/ripgrep)
    - Search your entire git repo for a specific pattern.
    - *Really useful!* E.g. for refactoring comments.


#### Misc Plugins
- Undo-tree
    - `,u`: Toggle Undo-tree
- Surround
    - The three "core" operations of `add/delete/change` can be done with the keymaps `ys{motion}{char}`, `ds{char}`, and `cs{target}{replacement}`
    - See [nvim-surround](https://github.com/kylechui/nvim-surround#rocket-usage) for examples
- Substitute
    - `sx` : Substitution operator.
    - Eg. To exchange two words, place your cursor on the first word and type `sxiw`. Then move to the second word and type `sxiw` again.
- Comment
    - `gc` : Comment Operator 
    - E.g. Use `gcc` to comment/uncomment a line. Use `gc` to comment/uncomment a selection.

#### Debugging
- Currently the debugger is configured to use llvm's lldb-vscode on mac for C++. 
- `,db` : Toggle Debugging windows
- `,k` : View value of expression under cursor
- `,s` : Step Into
- `,n` : Step Over
- `,o` : Step Out
- `,b` : Toggle BreakPoint
- `,dc` : Continue running

#### MarkDown and AsciiDoc
Type `:MarkDownPreview` or `:AsciidocPreview` to get a live preview of the markdown/asciidoc file you're currently editing. These use your default web-browser.
