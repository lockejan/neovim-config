local chat = require("CopilotChat")
local prompts = require("CopilotChat.config.prompts")
local select = require("CopilotChat.select")
local cutils = require("CopilotChat.utils")

local COPILOT_PLAN = [[
You are a software architect and technical planner focused on clear, actionable development plans.
]] .. prompts.COPILOT_BASE.system_prompt .. [[

When creating development plans:
- Start with a high-level overview
- Break down into concrete implementation steps
- Identify potential challenges and their solutions
- Consider architectural impacts
- Note required dependencies or prerequisites
- Estimate complexity and effort levels
- Track confidence percentage (0-100%)
- Format in markdown with clear sections

Always end with:
"Current Confidence Level: X%"
"Would you like to proceed with implementation?" (only if confidence >= 90%)
]]

chat.setup({
  mappings = {
    reset = false,
    show_diff = {
      full_diff = true,
    },
    rename = {
      mode = "v",
      keymap = "<leader>aan",
      desc = "Rename the variable",
    },
    chat = {
      mode = { "n", "v" },
      keymap = "<leader>zc",
      desc = "Chat with Copilot",
    },
    explain = {
      mode = "v",
      keymap = "<leader>ze",
      desc = "Explain Code",
    },
    review = {
      mode = "v",
      keymap = "<leader>zr",
      desc = "Review Code",
    },
    fix = {
      mode = "v",
      keymap = "<leader>zf",
      desc = "Fix Code Issues",
    },
    optimize = {
      mode = "v",
      keymap = "<leader>zo",
      desc = "Optimize Code",
    },
    docs = {
      mode = "v",
      keymap = "<leader>zd",
      desc = "Generate Docs",
    },
  },
  prompts = {
    Explain = {
      mapping = "<leader>ae",
      description = "AI Explain",
    },
    Review = {
      mapping = "<leader>ar",
      description = "AI Review",
    },
    Tests = {
      mapping = "<leader>at",
      description = "AI Tests",
    },
    Fix = {
      mapping = "<leader>af",
      description = "AI Fix",
    },
    Optimize = {
      mapping = "<leader>ao",
      description = "AI Optimize",
    },
    Docs = {
      mapping = "<leader>ad",
      description = "AI Documentation",
    },
    Commit = {
      mapping = "<leader>ac",
      description = "AI Generate Commit",
      selection = select.buffer,
    },
    Plan = {
      prompt = "Create or update the development plan for the selected code. Focus on architecture, implementation steps, and potential challenges.",
      system_prompt = COPILOT_PLAN,
      context = "file:.copilot/plan.md",
      progress = function()
        return false
      end,
      callback = function(response, source)
        chat.chat:append("Plan updated successfully!", source.winnr)
        local plan_file = source.cwd() .. "/.copilot/plan.md"
        local dir = vim.fn.fnamemodify(plan_file, ":h")
        vim.fn.mkdir(dir, "p")
        local file = io.open(plan_file, "w")
        if file then
          file:write(response)
          file:close()
        end
      end,
    },
    Rename = {
      mapping = "<leader>zn",
      prompt = "Please rename the variable correctly in given selection based on context",
      selection = function(source)
        local select = require("CopilotChat.select")
        return select.visual(source)
      end,
    },
  },
})

-- map("v", "<leader>zn", "<cmd>CopilotChatRename<cr>")
