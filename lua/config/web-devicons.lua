-- if !exists('g:loaded_devicons') | finish | endif

require'nvim-web-devicons'.setup {
 -- your personal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
