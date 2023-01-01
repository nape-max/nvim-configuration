local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        -- move to prev result
        ["<C-k>"] = actions.move_selection_previous,
        -- move to next result
        ["<C-j>"] = actions.move_selection_next,
        -- send selected to quickfixlist
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, 
      },
    },
  }
})

telescope.load_extension("fzf")
