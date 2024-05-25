local M = {}


JSON_QUOTE = '"'
TRUE_LEN = #'true'
FALSE_LEN = #'false'
NULL_LEN = #'null'

--- Lex String
--- @param _str string String to lex
--- @return string|nil json The evaluated json
--- @return string _str The remaining string
function M.lex_string(_str)
    local json = ''

    if _str:sub(1, 1) == JSON_QUOTE then
        _str = _str:sub(2)
    else
        return nil, _str
    end

    for char in _str:gmatch('.') do
        if char == JSON_QUOTE then
            return json, _str:sub(#json + 2)
        else
            json = json .. char
        end
    end

    error('Missing closing quote for JSON string')
end

--- Lex Number
--- @param _str string String to lex into a number
--- @return string|nil json The evaluated json
--- @return string _str The remaining string
function M.lex_number(_str)
    local json = ''

    if _str:sub(1, 1) == '-' then
        json = json .. '-'
        _str = _str:sub(2)
    end

    if _str:sub(1, 1):find('[eE]') then
        error('JSON number cannot start with exponent')
    end

    for char in _str:gmatch('.') do
        if char == '-' then
            error('Invalid JSON number')
        end
        if char:find('[%d%.]') then
            json = json .. char
        else
            break
        end
    end

    if #json == 0 then
        return nil, _str
    end

    if json:sub(-1) == '.' then
        error('Missing digit after decimal point in JSON number')
    end

    if json:sub(-1):find('[eE]') then
        error('Missing digit after exponent in JSON number')
    end

    return json, _str:sub(#json + 1)
end

--- Lex Boolean
--- @param _str string String to lex into a boolean
--- @return boolean|nil json The evaluated json
--- @return string _str The remaining string
function M.lex_bool(_str)
    if (#_str >= TRUE_LEN) and (_str:sub(1, TRUE_LEN) == 'true') then
        return true, _str:sub(TRUE_LEN + 1)
    elseif (#_str >= FALSE_LEN) and (_str:sub(1, FALSE_LEN) == 'false') then
        return false, _str:sub(FALSE_LEN + 1)
    end

    return nil, _str
end

--- Lex Null
--- @param _str string String to lex into null
--- @return boolean|nil json The evaluated json
--- @return string _str The remaining string
function M.lex_null(_str)
    if (#_str >= NULL_LEN) and (_str:sub(1, NULL_LEN) == 'null') then
        return true, _str:sub(NULL_LEN + 1)
    end

    return nil, _str
end

--- Lexes and tokenizes a json string
--- @param _str string String to lex
--- @return table tokens The list of tokens
function M.lex(_str)
    local tokens = {}
    local json = nil
    local char = nil

    while _str ~= nil do
        json, _str = M.lex_string(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        json, _str = M.lex_number(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        json, _str = M.lex_bool(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        json, _str = M.lex_null(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        char = _str:sub(1, 1)

        if char:find('%s') then
            _str = _str:sub(2)
        elseif char:find('[%[%]{}:,]') then
            table.insert(tokens, char)
            _str = _str:sub(2)
        elseif #char == 0 then
            break
        else
            error('Unexpected character: ' .. char)
        end

        ::continue::
    end

    return tokens
end

---Parses a json array from tokens
---@param tokens table Table containing the tokens
---@return table
---@return table
function M.parse_array(tokens)
    local json = nil
    local json_array = {}
    local token = tokens[1]

    if token == ']' then
        table.remove(tokens, 1)
        return {}, tokens
    end

    while true do
        json, tokens = M.parse(tokens)
        table.insert(json_array, json)

        token = tokens[1]
        if token == ']' then
            table.remove(tokens, 1)
            return json_array, tokens
        elseif token ~= ',' then
            error('Expected comma between array elements')
        else
            table.remove(tokens, 1)
        end
    end
end

---Parses a lua table of json tokens into a lua table
---@param tokens table
---@return table
---@return table
function M.parse_object(tokens)
    local json_key = nil
    local json_value = nil
    local json_object = {}
    local token = tokens[1]

    if token == '}' then
        table.remove(tokens, 1)
        return {}, tokens
    end

    while true do
        json_key = tokens[1]
        if type(json_key) == 'string' then
            table.remove(tokens, 1)
        else
            error('JSON object keys must be strings')
        end

        if tokens[1] ~= ':' then
            error('Expected colon between object key and value. ' .. tokens[1])
        end

        table.remove(tokens, 1)
        json_value, tokens = M.parse(tokens)
        json_object[json_key] = json_value

        token = tokens[1]
        if token == '}' then
            table.remove(tokens, 1)
            return json_object, tokens
        elseif token ~= ',' then
            error('Expected comma between object elements')
        end
        table.remove(tokens, 1)
    end
end

---Parses a lua table of json tokens into a lua table
---@param tokens table
---@param is_root? boolean
---@return table
---@return table
function M.parse(tokens, is_root)
    local token = tokens[1]
    is_root = is_root or false

    if is_root and token ~= '{' then
        error('JSON root must be an object')
    end

    if token == '{' then
        table.remove(tokens, 1)
        return M.parse_object(tokens)
    elseif token == '[' then
        table.remove(tokens, 1)
        return M.parse_array(tokens)
    elseif #tokens > 0 then
        table.remove(tokens, 1)
        return token, tokens
    end

    return {}, {}
end

---Converts a json string to a table
---@param _str string
---@return table
---@return table
function M.from_string(_str)
    local tokens = M.lex(_str)
    return M.parse(tokens, true)
end

return M
