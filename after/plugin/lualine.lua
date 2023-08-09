require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            { 'branch' },
            {
                'diff',
                colored = true,
                symbols = { added = '+', modified = '~', removed = '-' },
                source = nil
            },
            {
                'diagnostics',
                update_in_insert = false,
                always_visible = false
            }
        },
        lualine_c = {'filename', 'selectioncount'},
        lualine_x = {
            {
                'buffers',
                max_length = vim.o.columns * 4 / 10,
                show_filename_only = true,
                hide_filename_extension = false,
                show_modified_status = true,
                draw_empty = false
            }
        },
        lualine_y = {'filetype'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'location'}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
