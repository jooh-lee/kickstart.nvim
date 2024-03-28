-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("daniel.telescope")
    end
  },
  {
    "preservim/nerdtree",
    branch = "master",
  },
  {
    "justinmk/vim-dirvish",
    config = function()
      vim.cmd [[
             command! VLeftDirvish leftabove vsplit | vertical resize 50 | silent Dirvish
             command! VLeftDirvishFile leftabove vsplit | vertical resize 50 | silent Dirvish %
             nnoremap <leader>fs :VLeftDirvish<CR>
             nnoremap <leader>ff :VLeftDirvishFile<CR>
             ]]
    end
  },
  {
    "roginfarrer/vim-dirvish-dovish",
    branch = "main",
    dependencies = {
      "justinmk/vim-dirvish",
    },
    config = function()
      vim.cmd [[
           let g:dirvish_dovish_map_keys = 0

           augroup dirvish_config
           autocmd!
           " unmap dirvish default
           autocmd FileType dirvish silent! unmap <buffer><C-p>
           autocmd FileType dirvish silent! unmap <buffer>p

           " My mappings
           autocmd FileType dirvish silent! map <buffer>i <Plug>(dovish_create_file)
           autocmd FileType dirvish silent! map <buffer>I <Plug>(dovish_create_directory)
           autocmd FileType dirvish silent! map <buffer>dd <Plug>(dovish_delete)
           autocmd FileType dirvish silent! map <buffer>r <Plug>(dovish_rename)
           autocmd FileType dirvish silent! map <buffer>yy <Plug>(dovish_yank)
           autocmd FileType dirvish silent! map <buffer>yy <Plug>(dovish_yank)
           autocmd FileType dirvish silent! map <buffer>p <Plug>(dovish_copy)
           autocmd FileType dirvish silent! map <buffer>P <Plug>(dovish_move)
           augroup END
           ]]
    end
  },
  {
    "kristijanhusak/vim-dirvish-git",
    dependencies = {
      "justinmk/vim-dirvish",
    },
  },
  {
    "hashivim/vim-terraform",
  },
  {
    "ntpeters/vim-better-whitespace",
  },
}
