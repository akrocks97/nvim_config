
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", {desc="cprev"})
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", {desc="cnext"})
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", {desc="[M]ake [R]ain"});

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

vim.keymap.set("n", "tn", ":tabnext<CR>", {desc="[T]ab [N]ext"})
vim.keymap.set("n", "tp", ":tabprev<CR>", {desc="[T]ab [P]rev"})
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", {desc="NERD Tree Toggle"})


-- Remaps to open and close the qflist
vim.keymap.set("n", "<leader>co", ":copen<CR>", {desc="[C][O]pen"})
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", {desc="[C][C]lose"})
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string default_text=" .. vim.fn.expand("<cword>") .. "<CR>", {desc='[F]ind [W]ord'})

function live_grep_word()
    local word_under_cursor = vim.fn.expand("<cword>")
    print("Word under cursor is", word_under_cursor)
    if word_under_cursor ~= "" then
        vim.cmd("Telescope live_grep default_text=" .. word_under_cursor)
    end
end

vim.keymap.set("n", "<leader>frw", ":lua live_grep_word()<CR>", {desc='[F]ind [R]ipgrep [W]ord'})

