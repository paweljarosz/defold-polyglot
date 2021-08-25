local M = {}

local function import_csv(path)
	assert(path)
	local data = sys.load_resource(path)
	local output_table = {}
	local i = 1
	for line in string.gmatch(data, "[^\r\n]+") do
		output_table[i] = {}
		for word in string.gmatch(line, '([^,]+)') do
			if word == "TRUE" then word = true
			elseif word == "FALSE" then word = false
			end
			local num = tonumber(word)
			if num then word = num end
			table.insert(output_table[i], word)
		end
		i = i + 1
	end
	return output_table
end

M.polyglot = {}
M.language = "English"

function M.import(path)
	local polyglot = import_csv(path)
	local string_id = nil
	local language_en = nil
	for row_i,row in ipairs(polyglot) do
		if row_i == 3 then
			language_en = row
		elseif row_i > 6 then
			for col_i,word in ipairs(row) do
				if col_i == 1 then
					string_id = word
				elseif (col_i > 2) then
					if not language_en[col_i] then break end
					if not M.polyglot[language_en[col_i]] then M.polyglot[language_en[col_i]] = {} end
					if not M.polyglot[language_en[col_i]][string_id] then M.polyglot[language_en[col_i]][string_id] = {} end
					M.polyglot[language_en[col_i]][string_id] = word
				end
			end
		end
	end
	return M.polyglot
end

function M.set_language(language_en)
	M.language = language_en
end

function M.get(string_id)
	return M.polyglot[M.language][string_id]
end

return M