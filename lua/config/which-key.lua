local M = {}

function M.setup()
	require("which-key").setup({
		global = false,
		win = {
			wo = {
				winblend = 0,
			},
			width = 40,
			height = 15,
			padding = { 1, 2 },
			no_overlap = false,
			title = true,
			title_pos = "center",
			border = "rounded",
			zindex = 1000,
		},
		layout = {
			height = { min = 4, max = 15 },
			width = { min = 20, max = 45 },
			spacing = 3,
			columns = 1,
		},
	})

	require("which-key").add({
		-- Top-level Leader Actions
		{ "<leader><leader>", desc = "Find Files (Telescope)" },
		{ "<leader>a", desc = "Harpoon Add File" },
		{ "<leader>1", desc = "Harpoon Slot 1" },
		{ "<leader>2", desc = "Harpoon Slot 2" },
		{ "<leader>3", desc = "Harpoon Slot 3" },
		{ "<leader>4", desc = "Harpoon Slot 4" },
		{ "<leader>D", desc = "Type Definition" },

		-- Groups & Sub-keys
		{ "<leader>b", group = "Buffers" },
		{ "<leader>ba", desc = "Close Other Buffers" },

		{ "<leader>c", group = "Code / C++ / Man" },
		{ "<leader>ca", desc = "LSP Code Actions" },
		{ "<leader>cs", desc = "Switch Header/Source" },
		{ "<leader>cm", desc = "CPPMan Word" },
		{ "<leader>cM", desc = "CPPMan Search" },

		{ "<leader>d", group = "Docs" },
		{ "<leader>dg", desc = "Generate Doc Annotations (Neogen)" },

		{ "<leader>f", group = "Find / Telescope" },
		{ "<leader>fg", desc = "Live Grep" },
		{ "<leader>fb", desc = "Open Buffers" },
		{ "<leader>fh", desc = "Help Tags" },
		{ "<leader>fH", desc = "Highlight Groups" },
		{ "<leader>fn", desc = "New Empty Buffer" },
		{ "<leader>ft", desc = "Todo Comments" },

		{ "<leader>g", group = "Glance / Definitions" },
		{ "<leader>gd", desc = "Glance Definitions" },
		{ "<leader>gD", desc = "LSP Declaration" },
		{ "<leader>gR", desc = "Glance References" },
		{ "<leader>gY", desc = "Glance Type Definitions" },
		{ "<leader>gM", desc = "Glance Implementations" },

		{ "<leader>h", group = "Harpoon / Help / 42 Norm" },
		{ "<leader>he", desc = "Harpoon Quick Menu" },
		{ "<leader>hj", desc = "Harpoon Next File" },
		{ "<leader>hk", desc = "Harpoon Prev File" },
		{ "<leader>hn", desc = "Norminette Rules Popup" },
		{ "<leader>hc", desc = "Live Norminette Check" },

		{ "<leader>l", group = "Lazy / Leaks (Valgrind)" },
		{ "<leader>lg", desc = "LazyGit UI" },
		{ "<leader>lv", desc = "Run Valgrind Leak Check" },

		{ "<leader>m", group = "Make (Makefile)" },
		{ "<leader>mm", desc = "Make Target Picker" },
		{ "<leader>mt", desc = "Toggle Make Terminal" },
		{ "<leader>mr", desc = "Run Default Make Target" },

		{ "<leader>n", group = "Notify" },
		{ "<leader>nc", desc = "Clear Notifications" },

		{ "<leader>r", group = "Refactor / Rename" },
		{ "<leader>ra", desc = "LSP Symbol Rename" },

		{ "<leader>s", group = "Screen / Splits" },
		{ "<leader>sh", desc = "Split Horizontal" },
		{ "<leader>sv", desc = "Split Vertical" },

		{ "<leader>t", group = "Terminal / Toggles" },
		{ "<leader>th", desc = "Terminal Horizontal" },
		{ "<leader>tv", desc = "Terminal Vertical" },
		{ "<leader>tt", desc = "Toggle Floating Terminal" },
		{ "<leader>tp", desc = "Toggle Transparency" },
		{ "<leader>ti", desc = "Toggle Inlay Hints" },

		{ "<leader>w", group = "LSP Workspace / Workflow" },
		{ "<leader>wa", desc = "Add Workspace Folder" },
		{ "<leader>wr", desc = "Remove Workspace Folder" },
		{ "<leader>wl", desc = "List Workspace Folders" },
		{ "<leader>wn", desc = "Dismiss / Notification History" },

		{ "<leader>x", group = "Trouble / Diagnostics" },
		{ "<leader>xx", desc = "Toggle Diagnostics (Trouble)" },
		{ "<leader>xX", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>xs", desc = "Symbols (Trouble)" },
		{ "<leader>xl", desc = "LSP Definitions / References" },
		{ "<leader>xL", desc = "Location List (Trouble)" },
		{ "<leader>xQ", desc = "Quickfix List (Trouble)" },

		-- Localleader mappings
		{ "<localleader>f", group = "formatting / 42 header" },
		{ "<localleader>fn", desc = "Apply 42 C Formatter" },
		{ "<localleader>fh", desc = "Insert 42 Header" },
		{ "<localleader>s", group = "syntax / spell" },
		{ "<localleader>sc", desc = "Check Syntax and Run" },
		{ "<localleader>sw", desc = "Spell Suggestions" },
		{ "<localleader>t", group = "typr (typing test)" },
		{ "<localleader>tt", desc = "Open Typr" },
		{ "<localleader>ts", desc = "Typr Statistics" },
		{ "<localleader>d", desc = "Dashboard" },
		{ "<localleader>m", desc = "Dynamic Manual / Manpage" },
		{ "<localleader>e", desc = "Error List (Quickfix Float)" },
	})
end

return M
