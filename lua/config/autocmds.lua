--[[
-- Ne pas envahire de buffer pour des fichiers ouverts par nvim mais pas modifiés
--]]

local augroup = vim.api.nvim_create_augroup("PinnedBuffers", { clear = true })

local function is_protected(buf)
  return vim.bo[buf].buftype ~= ""
      or vim.bo[buf].filetype == "oil"
end

-- Ferme le buffer quitté s'il n'est pas épinglé
vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup,
  callback = function(args)
    local buf = args.buf

    if is_protected(buf) then return end
    if vim.b[buf].pinned then return end

    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(buf) then return end
      if vim.b[buf].pinned then return end -- re-check : a pu changer entre-temps

      -- encore visible dans une autre fenêtre ?
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then return end
      end

      pcall(vim.api.nvim_buf_delete, buf, {})
    end)
  end,
})

-- Épingle automatiquement tout buffer modifié
vim.api.nvim_create_autocmd("BufModifiedSet", {
  group = augroup,
  callback = function(args)
    if vim.bo[args.buf].modified then
      vim.b[args.buf].pinned = true
    end
  end,
})


