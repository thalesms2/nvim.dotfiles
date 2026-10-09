vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]ath [V]iewer" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, { desc = "[P]ath [V]iewer" })

-- Move linhas selecionadas
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centraliza a linha depois de dar um pgUp ou pgDn
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Cola substituindo sem sobrescrever" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copia para a área de transferencia do sistema" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copia a linha inteira para a área de transferencia do sistema" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Apaga sem sujar a área de transferencia" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "gQ", "<nop>", { desc = "Remove Modo Ex" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Próximo da quickfix list" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Anterior da quickfix list" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Próximo da location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Anterior da location list" })

vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace na palavra do cursor em todo o arquivo" }
)

-- Move entre janelas
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.wo.number = true

-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- testing
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- window management
vim.keymap.set("n", "<leader>wsv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>wsh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>wse", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wsx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
vim.keymap.set("n", "<leader>wto", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab

vim.keymap.set("n", "<leader>wtx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>wtn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>wtp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>wtf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- resize split
-- vim.keymap.set("n", "<M-,>", "<c-w>5<", { desc = "Decrease horinzontally" })
-- vim.keymap.set("n", "<M-.>", "<c-w>5>", { desc = "Increase horinzontally" })
-- vim.keymap.set("n", "<M-t>", "<c-w>+<", { desc = "Decrease vertically" })
-- vim.keymap.set("n", "<M-s>", "<c-w>-<", { desc = "Increase vertically" })
--
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<cr>", { silent = true, desc = "makes file executable" })
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "restart neovim" })
