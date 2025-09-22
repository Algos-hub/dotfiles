# Personal dotfiles

These are my .dotfiles that I use in my own personal configuration.

Currently I'm using [Arch Linux](https://archlinux.org/) with [Hyprland](https://hypr.land/), [Kitty](https://sw.kovidgoyal.net/kitty/), ZSH alongside [Oh-My-Zsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for a custom ZSH theme, Tmux, and Neovim.<br/>
I'm also using [yay](https://github.com/Jguer/yay) as my AUR helper.

This configuration also requires a [Nerd Font](https://www.nerdfonts.com/) to be installed. Currently I use the JetBrains-Mono Regular.

This repo was designed to be used with GNU [`stow`](https://www.gnu.org/software/stow/), so setting everything up should be as simple as writing<br/> `stow $directory_name` from the root of this repo.

# Installation

**Assuming you use arch, or an arch-based distro, but the steps should be similar regardless.**
**This configuration also assumes you already had GDM and the Gnome Desktop Environment installed (I highly recommend having a second, more "stable", Desktop Environment in case you break something and need to fix it).**

1. `Installation`
   - Run `yay -S hyprland rofi waybar kitty pwvucontrol nerd-fonts-git fastfetch neovim zsh stow dconf dconf-editor` in your terminal.
   - Run `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` to install Oh-My-Zsh.
   - Run `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"` to install Powerlevel10k.
   - Run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to set up Tmux TMP.
   - Run `git clone https://github.com/Algos-hub/dotfiles` to clone this repo.
2. `Configuration & Setup`
   - From the root directory of this repo, run <br/>`stow hypr waybar nvim bash zsh fastfetch gtk-3.0 gtk-4.0 icons p10k rofi themes wallpapers Xresources kitty`<br/>(if you already have some configuration files for those programs, make sure to back them up so you can reimplement them later)
   - Use a text editor to edit the Hyprland config file in `~/.config/hypr/hyprland.conf`. You need to edit the config
     to setup your wallpaper and monitor settings.
   - Enter `dconf-editor` in your terminal to open up the dconf gui program, search "gtk-theme", and set the theme value to `rose-pine-moon`. You may also use dconf to set your icon theme and cursor theme to ones of your liking.
3. `Creative Liberty`
   - I recommend reading and editing all config files them as you see fit; you may want to add or change things, such as the keybinds for Hyprland, or
     the fonts used.
   - Feel free to continue reading this document for more details on the design & softwares used.

# Tmux configuration

<details>
    <summary>
        Plugins used:
    </summary>

<ul>
    <li>Plugin Manager: <a href="https://github.com/tmux-plugins/tpm">tmux-plugins/tpm</a></li>
    <li>Standard base options: <a href="https://github.com/tmux-plugins/tmux-sensible">tmux-plugins/tmux-sensible</a></li>
    <li>Copy and paste: <a href="https://github.com/tmux-plugins/tmux-yank">tmux-plugins/tmux-yank</a></li>
    <li>Status line: <a href="https://github.com/o0th/tmux-nova">o0th/tmux-nova</a></li>
    <li>Vim navigation integration: <a href="https://github.com/christoomey/vim-tmux-navigator">christoomey/vim-tmux-navigator</a></li>
    <li>Tmux session manager: <a href="https://github.com/tmux-plugins/tmux-resurrect">tmux-plugins/tmux-resurrect</a></li>
    <ul>
</details>

<details>
    <summary><h2>Installation</h2></summary>

### 1: Finish setting up TPM

This tmux configuration requires TPM. If you already have TPM installed you can skip this step.<br/>
To install tmp you can follow their install guides in their official Github repo [here](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation)<br/>

Once that's done, open tmux and press `Prefix` + `I` (with my dotfiles, the `Prefix` should be `CTRL + Space`, otherwise the default should be `CTRL + B`)

</details>

# Neovim configuration

<details>
    <summary>
        Plugins used:
    </summary>
    <ul>
        <li>Theme: <a href="https://github.com/maxmx03/solarized.nvim">maxmx03/solarized.nvim</a></li>
        <li>Tmux navigation integration: <a href="https://github.com/christoomey/vim-tmux-navigator">christoomey/vim-tmux-navigator</a></li>
        <li>Auto-pairing (parenthesis, brackets, quotes, etc...): <a href="https://github.com/windwp/nvim-autopairs">windwp/nvim-autopairs</a></li>
        <li>Enhancing `a`/`i` selection: <a href="https://github.com/echasnovski/mini.ai">echasnovski/mini.ai</a></li>
        <li>Enhancing surrounding text: <a href="https://github.com/kylechui/nvim-surround">kylechui/nvim-surround</a></li>
        <li>Icons: <a href="https://github.com/nvim-tree/nvim-web-devicons">nvim-tree/nvim-web-devicons</a></li>
        <li>Git wrapper: <a href="https://github.com/tpope/vim-fugitive">tpope/vim-fugitive</a></li>
        <li>Git buffer integration: <a href="https://github.com/lewis6991/gitsigns.nvim">lewis6991/gitsigns.nvim</a></li>
        <li>Statusline: <a href="https://github.com/nvim-lualine/lualine.nvim">nvim-lualine/lualine.nvim</a></li>
        <li>Comment shortcut: <a href="https://github.com/numToStr/Comment.nvim">numToStr/Comment.nvim</a></li>
        <li>File tree: <a href="https://github.com/nvim-tree/nvim-tree.lua">nvim-tree/nvim-tree.lua</a></li>
        <li>Custom ColorColumn behavior: <a href="https://github.com/m4xshen/smartcolumn.nvim">m4xshen/smartcolumn.nvim</a></li>
        <li>Custom splash screen: <a href="https://github.com/startup-nvim/startup.nvim">startup-nvim/startup.nvim</a></li>
        <li>Fuzzy finder: <a href="https://github.com/nvim-telescope/telescope.nvim">nvim-telescope/telescope.nvim</a>
            <ul>
            dependency:
                <li><a href="https://github.com/nvim-lua/plenary.nvim">nvim-lua/plenary.nvim</a></li>
            </ul>
        </li>
        <li>Syntax highlighting: <a href="https://github.com/nvim-treesitter/nvim-treesitter">nvim-treesitter/nvim-treesitter</a></li>
        <li>Formatter: <a href="https://github.com/nvimtools/none-ls.nvim">nvimtools/none-ls.nvim</a>
            <ul>
            dependency:
                <li><a href="https://github.com/nvimtools/none-ls-extras.nvim">nvimtools/none-ls-extras.nvim</a></li>
            </ul>
        </li>
        <li>Language Server Protocol (LSP): <a href="https://github.com/neovim/nvim-lspconfig">neovim/nvim-lspconfig</a>
            <ul>
            dependencies:
            <li><a href="https://github.com/hrsh7th/cmp-nvim-lsp">hrsh7th/cmp-nvim-lsp</a></li>
            <li><a href="https://github.com/hrsh7th/cmp-buffer">hrsh7th/cmp-buffer</a></li>
            <li><a href="https://github.com/hrsh7th/cmp-path">hrsh7th/cmp-path</a></li>
            <li><a href="https://github.com/hrsh7th/cmp-cmdline">hrsh7th/cmp-cmdline</a></li>
            <li><a href="https://github.com/hrsh7th/nvim-cmp">hrsh7th/nvim-cmp</a></li>
            <li><a href="https://github.com/williamboman/mason.nvim">williamboman/mason.nvim</a> (LSP package manager)</li>
            <li><a href="https://github.com/williamboman/mason-lspconfig.nvim">williamboman/mason-lspconfig.nvim</a></li>
            <li><a href="https://github.com/kosayoda/nvim-lightbulb">kosayoda/nvim-lightbulb</a> (For code actions notifications)</li>
            <li><a href="https://github.com/hrsh7th/cmp-vsnip">hrsh7th/cmp-vsnip</a></li>
            <li><a href="https://github.com/hrsh7th/vim-vsnip">hrsh7th/vim-vsnip</a></li>
            <li><a href="https://github.com/hrsh7th/vim-vsnip-integ">hrsh7th/vim-vsnip-integ</a></li>
            <li><a href="https://github.com/artemave/workspace-diagnostics.nvim">artemave/workspace-diagnostics.nvim</a> (For LSP diagnostics per workspace instead of per buffer)</li>
        </ul>
        </li>
    </ul>

</details>

<details>
    <summary><h2>Installation</h2></summary>

### 1: Install make (optional)

This neovim configuration uses the telescope-fzf-native.nvim extension for telescope which requires `make`.<br/>
`make` is used to build the binaries for telescope-fzf-native.nvim, which is used to speed up telescope but is not required.<br/>
If you do not wish to use telescope-fzf-native.nvim you can delete `telescope-fzf.lua` and remove the lines 4-13 and 17-24 from `telescope.lua`<br/>

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
