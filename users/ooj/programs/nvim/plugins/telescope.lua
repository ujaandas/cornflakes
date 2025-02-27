local builtin = require("telescope.builtin")
-- Find within project files
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
-- Find within git project files
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
-- Find custom grep 
vim.keymap.set("n", "<leader>gr", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
