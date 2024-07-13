# Personal dotfiles

These are my .dotfiles that I use in my own personal configuration.

Currently I'm using an M1 MacBook Air running [iTerm2](https://iterm2.com/), ZSH alongside [Oh-My-Zsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for a custom ZSH theme, Tmux, and Neovim.
I'm also using [Homebrew](https://brew.sh/) as a package manager.

This configuration also requires a [Nerd Font](https://www.nerdfonts.com/) to be installed. Currently I use the JetBrains-Mono Regular.

<details>
    <summary>
    I also have multiple CLI tools that I use that are all listed here.
    </summary>
    
    * [NodeJS](https://nodejs.org/en)\
    * [fzf](https://github.com/junegunn/fzf)\
    * [bat](https://github.com/sharkdp/bat)\
    * [Lua](https://www.lua.org/)\
    * [LuaJIT](https://luajit.org/)\
    * [Luarocks](https://luarocks.org/)\
    * [Python](https://www.python.org/)\
    * [pipx](https://github.com/pypa/pipx)\
    * [PHP](https://www.php.net/)\
    * [pretty-php](https://github.com/lkrms/pretty-php)\
    * [prettierd](https://github.com/fsouza/prettierd)\
    * [tree-sitter](https://tree-sitter.github.io/tree-sitter/)\
    * [ktlint](https://github.com/pinterest/ktlint)\
    * [neofetch](https://github.com/dylanaraps/neofetch)\
</details>

And if you're also using a Mac you can run the [`installs.sh`](https://github.com/Algos-hub/dotfiles/zshrc/installs.sh) script inside the [`zshrc`](https://github.com/Algos-hub/dotfiles/zshrc) directory to install all the CLI tools alongside Neovim and Tmux.

<details>
    <summary>
<h2> .zshrc </h2>
    </summary>

All of my `.zshrc` settings have been split into different files inside the [`zshrc`](https://github.com/Algos-hub/dotfiles/zshrc) directory, as well as my Oh-My-Zsh, and Powerlevel10k settings.

# Installation

### 1: Install Oh-My-Zsh and Powerlevel10k

First start by installing [Oh-My-Zsh](https://ohmyz.sh/) and [Powerlevel10k](https://github.com/romkatv/powerlevel10k).

You can find the installation guides on their respective websites.

### 2: Copy the provided files

Finally, copy all of the contents of [`alias.sh`](https://github.com/Algos-hub/dotfiles/zshrc/alias.sh), [`exports.sh`](https://github.com/Algos-hub/dotfiles/zshrc/exports.sh), and [`oh-my-zsh.sh`](https://github.com/Algos-hub/dotfiles/zshrc/oh-my-zsh.sh) into your `.zshrc`. Then copy the contents of [`.p10k.zsh`](https://github.com/Algos-hub/dotfiles/zshrc/.p10k.zsh) into your `.p10k.zsh` file.

</details>

<details>
    <summary>
<h2> Tmux configuration </h2>
    </summary>
    

The following plugins have been used:

Plugin Manager: [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)\
Standard base options: [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)\
Copy and paste: [tmux-plugins/tmux-yank](https://github.com/tmux-plugins/tmux-yank)\
Status line: [o0th/tmux-nova](https://github.com/o0th/tmux-nova)\
Vim navigation integration: [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

# Installation

### 1: Install tpm

This tmux configuration requires the tpm. If you already have tpm installed you can skip this step.\
    To install tmp you can follow their install guides in their official Github repo [here](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation)

### 2: Cloning this repo

Clone this repo and move the .tmux.conf file into your home directory.

```bash
    git clone https://github.com/Algos-hub/dotfiles ~
    mv ~/dotfiles/tmux/.tmux.conf ~
```

Once that's done, open tmux and press `Prefix` + `I` (on a fresh intallation of tmux it should be `C-b`)

</details>

<details>
    <summary>
<h2> Neovim configuration </h2>
    </summary>

<details>
    <summary>
        Plugins used:
    </summary>

    * Theme: [maxmx03/solarized.nvim](https://github.com/maxmx03/solarized.nvim)\
    * Tmux navigation integration: [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)\
    * Auto-pairing (parenthesis, brackets, quotes, etc...): [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)\
    * Enhancing `a`/`i` selection: [echasnovski/mini.ai](https://github.com/echasnovski/mini.ai)\
    * Enhancing surrounding text: [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)\
    * Icons: [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)\
    * Git wrapper: [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)\
    * Git buffer integration: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)\
    * Statusline: [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)\
    * Comment shortcut: [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)\
    * File tree: [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)\
    * Custom ColorColumn behavior: [m4xshen/smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim)\
    * Custom splash screen: [startup-nvim/startup.nvim](https://github.com/startup-nvim/startup.nvim)\
    * Fuzzy finder: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)\
            dependency: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) \
    * Syntax highlighting: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)\
    * Formatter: [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)\
            dependency: [nvimtools/none-ls-extras.nvim](https://github.com/nvimtools/none-ls-extras.nvim) \
    * Language Server Protocol (LSP): [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)\
            dependencies:\
            * [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)\
            * [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)\
            * [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)\
            * [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)\
            * [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)\
            * [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) (LSP package manager)\
            * [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)\
            * [kosayoda/nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) (For code actions notifications)\
            * [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)\
            * [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)\
            * [hrsh7th/vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ)\
            * [artemave/workspace-diagnostics.nvim](https://github.com/artemave/workspace-diagnostics.nvim) (For LSP diagnostics per workspace instead of per buffer)

</details>

<details>
    <summary>Screenshots</summary>

### Startup screen

![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/startup.jpg "Startup screen")

### LSP integration

![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/lsp_integration_1.jpg "Code completion")
![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/lsp_integration_2.jpg "Code completion definition")
![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/lsp_integration_3.jpg "Buffer hover")
![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/code_actions.jpg "Code actions popup")

### File Explorer (nvim-tree)

![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/nvim_tree.jpg "File explorer")

### Fuzzy finder (telescope)

![alt-text](https://github.com/Algos-hub/neovim-config/blob/main/resources/telescope.jpg "Fuzzy finder popup")

</details>

# Installation

### 1: Install make (optional)

This neovim configuration uses the telescope-fzf-native.nvim extension for telescope which requires `make`.\
    `make` is used to build the binaries for telescope-fzf-native.nvim, which is used to speed up telescope but is not required.\
    If you do not wish to use telescope-fzf-native.nvim you can delete `telescope-fzf.lua` and remove the lines 4-13 and 17-24 from `telescope.lua`

#### `telescope.lua`

```lua
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',

    -- Comment this section if you don't want to use telescope-fzf-native.nvim

    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require("telescope").load_extension("fzf")
            end,
        }
    },

    -- End of comment

    config = function()
        require('telescope').setup({

        -- Comment this section if you don't want to use telescope-fzf-native.nvim

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }

        -- End of comment

        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
```

### 2: Cloning this repo

To install, clone this repo into your `.config` directory and rename the `neovim-config` directory to `nvim`.\
    If you already have an `nvim` directory, you may need to delete/move it somewhere else first.

```bash
    git clone https://github.com/Algos-hub/dotfiles ~
    mv ~/dotfiles/nvim/.config/nvim ~/.config
```

</details>
