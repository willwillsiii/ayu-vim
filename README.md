![Ayu - Banner](https://user-images.githubusercontent.com/10234894/156601082-7c748734-2aa8-467a-8160-285815af3720.png)

# Ayu vim (unofficial fork)

From left to right `let ayucolor` = `light`, `mirage`, `dark`
![Ayu - Demonstration](https://user-images.githubusercontent.com/10234894/156945507-ab1ef129-df1d-4633-ab1b-c89868ff7e73.png)

With `let g:ayu_extended_palette = 1`:
![Ayu - Extended color palette](https://user-images.githubusercontent.com/10234894/156945599-85027644-b5ac-47d1-a70e-5896b8618b4f.png)

# Installation

`ayu` only works if VIM supports `termguicolors` option. This is true for [Neovim](https://neovim.io) and VIM from 7.4.1799.

```vim
Plug 'Luxed/ayu-vim'    " or other package manager
"...
set termguicolors       " enable true colors support

set background=light    " for light version of theme
set background=dark     " for either mirage or dark version.
" NOTE: `background` controls `g:ayucolor`, but `g:ayucolor` doesn't control `background`

let g:ayucolor="mirage" " for mirage version of theme
let g:ayucolor="dark"   " for dark version of theme
" NOTE: g:ayucolor will default to 'dark' when not set. 

colorscheme ayu
```

# Supported Plugins

Here is a list of plugins which have been customized to work better with this theme:

- [vim-gitgutter](https://github.com/airblade/vim-gitgutter). Git sign column signs.
- [vim-signify](https://github.com/mhinz/vim-signify). General VCS sign column signs.
- [NERDTree](https://github.com/preservim/nerdtree). File explorer.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim). Fuzzy finder (neovim only).
- [YATS](https://github.com/HerringtonDarkholme/yats.vim). Yet Another TypeScript Syntax.
- [fugitive.vim](https://github.com/tpope/vim-fugitive). Git helper.
- [startify](https://github.com/mhinz/vim-startify). Start screen plugin.
- [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax). Pandoc specific markdown syntax.
- [haskell-vim](https://github.com/neovimhaskell/haskell-vim). Haskell syntax highlighting.
- [nvim-compe](https://github.com/hrsh7th/nvim-compe). Neovim completion plugin.
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp). Neovim completion plugin, successor to compe.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim). Indentation guides.
- [hlargs.nvim](https://github.com/m-demare/hlargs.nvim). Highlight arguments' definitions and usages.
- [vim-illuminate](https://github.com/RRethy/vim-illuminate). Automatically highlight other uses of the word under the cursor.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Neovim lsp config quickstart.
- [nvim-navic](https://github.com/SmiteshP/nvim-navic). Simple winbar/statusline plugin that shows your current code context.
- [coc.nvim](https://github.com/neoclide/coc.nvim)

And here is a list of other supported syntax groups:

- Vim8 and Neovim Terminals.
- Diff syntax.
- Netrw.
- Neovim's Built-in LSP.
- TreeSitter (Neovim only).
- Javascript.
- Vimscript.
- XML.
- INI.
- Shell.
- PHP.
- Ruby.

# Options

```vim
let g:ayu_italic_comment = 1 " defaults to 0.
let g:ayu_sign_contrast = 1 " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background
let g:ayu_extended_palette = 1 " defaults to 0. If set to 1, enables extended palette. Adds more colors to some highlights (function keyword, loops, conditionals, imports)
```

# nvim-ts-rainbow configuration

In your Tree-Sitter configuration add the following (in lua):

```lua
require('nvim-treesitter.configs').setup{
  rainbow = {
    enable = true,
    colors = require('ayu').rainbow_colors()
  }
}
```

# Statusline support

Currently, the ayu-vim theme supports the following statusline plugins:

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
  No setup is required. The theme is automatically applied.
- [vim-airline](https://github.com/vim-airline/vim-airline).
  No setup is required, but it is important to note that the ayu theme included in [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) will override the one present here.
- [lightline.vim](https://github.com/itchyny/lightline.vim).
  Add the following to your config (or modify your current lightline config): `let g:lightline = { 'colorscheme': 'ayu' }`

This is an example for `lualine.nvim`:

Light:
![image](https://user-images.githubusercontent.com/10234894/202318638-27ea1258-32cb-4327-bdfa-3eba2d85a323.png)

Mirage:
![image](https://user-images.githubusercontent.com/10234894/202318681-8a4f8837-94a6-49a5-8404-b264de3f01f6.png)

Dark:
![image](https://user-images.githubusercontent.com/10234894/202318748-d4057e18-1777-4096-bb1f-e0d62a3f7cf1.png)

# Customize The Theme To Your Liking

```vim
function! s:custom_ayu_colors()
  " Put whatever highlights you want here.
  " The ayu#hi function is defined as followed:
  " ayu#hi(highlight_group, foreground, background, [gui options])
  " See autoload/ayu.vim for color palette. 
  " `foreground` and `background` are required while the gui options are optional
  " `gui options` only represents the values you could put in the `gui` part of the highlight. See `:h highlight-gui`.
  call ayu#hi('IncSearch', '', 'vcs_modified')
endfunction

augroup custom_colors
  autocmd!
  autocmd ColorScheme ayu call s:custom_ayu_colors()
augroup END
```

Doing this will allow you to modify the theme to your liking while not modifying the colors for any other theme.

# Related Projects

- [ayu-vim](https://github.com/ayu-theme/ayu-vim): The official ayu-vim theme. It is currently un-maintained.
- [neovim-ayu](https://github.com/Shatur95/neovim-ayu): A reimplementation of the theme in lua for better Neovim and lua support.
