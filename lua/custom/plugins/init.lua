-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
return {
  {
    'rmagatti/goto-preview',
    dependencies = { 'rmagatti/logger.nvim' },
    event = 'BufEnter',
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    opts = {
      default_mappings = true,
    },
  },
  {
    'preservim/nerdtree',
    branch = 'master',
  },
  {
    'justinmk/vim-dirvish',
    config = function()
      vim.cmd [[
             command! VLeftDirvish leftabove vsplit | vertical resize 50 | silent Dirvish
             command! VLeftDirvishFile leftabove vsplit | vertical resize 50 | silent Dirvish %
             nnoremap <leader>fs :VLeftDirvish<CR>
             nnoremap <leader>ff :VLeftDirvishFile<CR>
             ]]
    end,
  },
  {
    'roginfarrer/vim-dirvish-dovish',
    branch = 'main',
    dependencies = {
      'justinmk/vim-dirvish',
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
    end,
  },
  {
    'kristijanhusak/vim-dirvish-git',
    dependencies = {
      'justinmk/vim-dirvish',
    },
  },
  {
    'hashivim/vim-terraform',
  },
  {
    'ntpeters/vim-better-whitespace',
  },
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.auto_reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ 'n', 'x' }, '<C-a>', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = 'Ask opencode' })
      vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
        require('opencode').select()
      end, { desc = 'Execute opencode action…' })
      vim.keymap.set({ 'n', 'x' }, 'ga', function()
        require('opencode').prompt '@this'
      end, { desc = 'Add to opencode' })
      vim.keymap.set({ 'n', 't' }, '<C-.>', function()
        require('opencode').toggle()
      end, { desc = 'Toggle opencode' })
      vim.keymap.set('n', '<S-C-u>', function()
        require('opencode').command 'session.half.page.up'
      end, { desc = 'opencode half page up' })
      vim.keymap.set('n', '<S-C-d>', function()
        require('opencode').command 'session.half.page.down'
      end, { desc = 'opencode half page down' })
      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
      vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
    end,
  },
}
