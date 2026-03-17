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

    -- Chain: add -> commit -> push
    vim.fn.jobstart({"git", "add", "."}, {
      on_exit = function(_, add_exit)
        if add_exit ~= 0 then
          print("Auto-push: 'git add' failed (" .. add_exit .. ")")
          return
        end

        vim.fn.jobstart({"git", "commit", "-m", "Auto-update from nvim"}, {
          on_exit = function(_, commit_exit)
            -- Exit code 1 for commit usually means "nothing to commit", which is fine
            if commit_exit ~= 0 and commit_exit ~= 1 then
              print("Auto-push: 'git commit' failed (" .. commit_exit .. ")")
              return
            end

            -- Now push, using --no-verify as per GEMINI.md convention
            vim.fn.jobstart({"git", "push", "origin", "main", "--no-verify"}, {
              on_exit = function(_, push_exit)
                if push_exit == 0 then
                  print("Cheatsheet pushed to GitHub! 🚀")
                elseif push_exit == 1 and commit_exit == 1 then
                  -- If commit had nothing to do, push might say "Everything up-to-date" (0)
                  -- or potentially 1 if there's some other non-critical mismatch.
                  -- But usually, we just want to know if it's up to date.
                  print("Cheatsheet is already up-to-date.")
                else
                  print("Auto-push: 'git push' failed (" .. push_exit .. ")")
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
