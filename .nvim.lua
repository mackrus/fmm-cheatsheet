-- Project-local Neovim configuration for FMM Cheatsheet
-- Requires ':set exrc' in your global Neovim config

local timer = nil
local debounce_ms = 2000 -- Wait 2 seconds before pushing

local function auto_push()
  if timer then
    timer:stop()
    timer:close()
  end

  timer = vim.loop.new_timer()
  timer:start(debounce_ms, 0, vim.schedule_wrap(function()
    print("Auto-updating cheatsheet...")
    vim.fn.jobstart({"git", "add", "."}, {
      on_exit = function()
        vim.fn.jobstart({"git", "commit", "-m", "Auto-update from nvim"}, {
          on_exit = function()
            vim.fn.jobstart({"git", "push", "origin", "main"}, {
              on_exit = function(_, exit_code)
                if exit_code == 0 then
                  print("Cheatsheet pushed to GitHub! 🚀")
                else
                  print("Auto-push failed (exit code " .. exit_code .. ")")
                end
              end
            })
          end
        })
      end
    })
    timer:close()
    timer = nil
  end))
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "main.typ",
  callback = auto_push,
  group = vim.api.nvim_create_augroup("CheatsheetAutoPush", { clear = true }),
})
