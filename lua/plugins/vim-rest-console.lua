-- Turn off the default key binding
vim.g.vrc_set_default_mapping = 0

-- Set the default response content type to JSON
-- vim.g_vrc_response_default_content_type = "application/json"

-- Set the output buffer name
vim.g.vrc_output_buffer_name = "_OUTPUT.json"

-- Run a format command on the response buffer
vim.g.vrc_auto_format_response_patterns = {
	json = "jq",
}

-- vim.g.vrc_curl_opts = {
-- 	["--silent"] = "",
-- 	["--include"] = "",
-- }

-- vim.g.vrc_curl_opts = {
-- 	"--silent" =  ""
-- }
