" clear cache so this reloads changes.
" useful for development
" lua package.loaded['onechad'] = nil
" lua package.loaded['onechad.theme'] = nil
" lua package.loaded['onechad.colors'] = nil
" lua package.loaded['onechad.util'] = nil
lua package.loaded['onechad.config'] = nil

lua require('onechad').colorscheme()
