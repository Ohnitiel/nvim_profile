JSON_QUOTE = '"'
TRUE_LEN = #'true'
FALSE_LEN = #'false'
NULL_LEN = #'null'

local function lex_string(_str)
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

local function lex_number(_str)
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

local function lex_bool(_str)
    if (#_str >= TRUE_LEN) and (_str:sub(1, TRUE_LEN) == 'true') then
        return true, _str:sub(TRUE_LEN + 1)
    elseif (#_str >= FALSE_LEN) and (_str:sub(1, FALSE_LEN) == 'false') then
        return false, _str:sub(FALSE_LEN + 1)
    end

    return nil, _str
end

local function lex_null(_str)
    if (#_str >= NULL_LEN) and (_str:sub(1, NULL_LEN) == 'null') then
        return true, _str:sub(NULL_LEN + 1)
    end

    return nil, _str
end

local function lex(_str)
    local tokens = {}
    local json = nil
    local char = nil

    while _str ~= nil do
        json, _str = lex_string(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        json, _str = lex_number(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        json, _str = lex_bool(_str)
        if json ~= nil then
            table.insert(tokens, json)
            goto continue
        end

        json, _str = lex_null(_str)
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

local parse

local function parse_array(tokens)
    local json = nil
    local json_array = {}
    local token = tokens[1]

    if token == ']' then
        table.remove(tokens, 1)
        return json, tokens
    end

    while true do
        json, tokens = parse(tokens)
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

local function parse_object(tokens)
    local json = nil
    local json_key = nil
    local json_value = nil
    local json_object = {}
    local token = tokens[1]

    if token == '}' then
        table.remove(tokens, 1)
        print(json, token)
        return json, tokens
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
        json_value, tokens = parse(tokens)
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

parse = function(tokens, is_root)
    local token = tokens[1]

    if is_root == nil then
        is_root = false
    end

    if is_root and token ~= '{' then
        error('JSON root must be an object')
    end

    if token == '{' then
        table.remove(tokens, 1)
        return parse_object(tokens)
    elseif token == '[' then
        table.remove(tokens, 1)
        return parse_array(tokens)
    elseif #tokens > 0 then
        table.remove(tokens, 1)
        return token, tokens
    end
end

local function from_string(_str)
    local tokens = lex(_str)
    return parse(tokens, true)
end



local db_file = io.input(os.getenv("HOME") .. "/.dotfiles/databases.json")
local content = io.read("*a")
local databases = from_string(content)
io.close(db_file)

print(#databases)
