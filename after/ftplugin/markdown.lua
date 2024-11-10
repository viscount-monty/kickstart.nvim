-- Run this file when a markdown file is opened
-- -- Define custom highlight groups for each markdown heading level
-- vim.api.nvim_set_hl(0, '@markdown.heading.1', { fg = '#7aa89f', bold = true })
-- vim.api.nvim_set_hl(0, '@markdown.heading.2', { fg = '#ffc894', bold = true })
-- vim.api.nvim_set_hl(0, '@markdown.heading.3', { fg = '#ffa066', bold = true })
-- vim.api.nvim_set_hl(0, '@markdown.heading.4', { fg = '#e46876', bold = true })
-- vim.api.nvim_set_hl(0, '@markdown.heading.5', { fg = '#938aa9', bold = true })
-- vim.api.nvim_set_hl(0, '@markdown.heading.6', { fg = '#975fb8', bold = true })
--
-- -- Link the custom highlight groups to Treesitter's markdown heading captures
-- vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { link = '@markdown.heading.1' })
-- vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { link = '@markdown.heading.2' })
-- vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { link = '@markdown.heading.3' })
-- vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { link = '@markdown.heading.4' })
-- vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { link = '@markdown.heading.5' })
-- vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { link = '@markdown.heading.6' })

-- Define custom highlight group for inline code
-- vim.api.nvim_set_hl(0, '@markdown.markdown_inline', { fg = '#975fb8' })

-- Link the custom highlight groups to Treesitter's markdown heading captures
-- vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { link = '@markdown.markdown_inline' })

-- Diable all italics
-- local hl_groups = vim.api.nvim_get_hl(0, {})
--
-- for key, hl_group in pairs(hl_groups) do
--   if hl_group.italic then
--     vim.api.nvim_set_hl(0, key, vim.tbl_extend('force', hl_group, { italic = false }))
--   end
-- end

-- Disable italics for inline code only
-- local hl_groups = vim.api.nvim_get_hl(0, {})
--
-- for key, hl_group in pairs(hl_groups) do
--   -- if hl_group.italic then
--   if key == '@markup.raw' then
--     vim.api.nvim_set_hl(0, key, vim.tbl_extend('force', hl_group, { italic = false }))
--     -- print('key: ', key)
--     -- print('  italic: ', hl_group.italic)
--   end
-- end

-- Set code block colour to same as inline code
-- vim.api.nvim_set_hl(0, '@markup.raw.block.markdown', { link = '@markup.raw' })
