local Worktree = require("git-worktree")
local Job = require("plenary.job")
-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Switch then
    print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
  end
  if op == Worktree.Operations.Create then
    print("Created new worktree ")
    Job:new({
      command = 'git',
      args = { 'submodule', 'update', '--init', '--recursive'},
      on_exit = function(j, return_val)
        print(return_val)
        print(j:result())
      end,
    }):start()
  end
end)

function updateGitSubmodules()
    Job:new({
        command = "git",
        args = { "submodule", "update", "--init", "--recursive" },
        on_exit = function(job)
            if job.code == 0 then
                print("Git submodules updated successfully.")
            else
                print("Error updating Git submodules.")
            end
        end,
    }):start()
end

vim.keymap.set("n", "<leader>gtt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {desc='[G]it [W]orktree'})
vim.keymap.set("n", "<leader>gta", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", {desc='[G]it [W]orktree [A]dd'})
