-- C-style printf. Doesn't append a newline.
---@param fmt string
---@param ... string|number
local function printf(fmt, ...)
    io.stdout:write(fmt:format(...))
end

-- Try to read line of text from user, from standard input stream.
-- If fails at any point it keeps trying. Maybe that's a bad thing...
---@param prompt string
---@param ... string|number
local function get_string(prompt, ...)
    local input = nil
    prompt = (prompt and prompt:format(...)) or "Input:"
    -- if `io.stdin.read` fails somehow, it'll return `nil`.
    while input == nil do
        printf(prompt)
        input = io.stdin:read("*l")
        -- Flush in case we need to read stdin again
        io.stdin:flush()
    end
    return input
end

---@param fn function
---@param name string
local function dump_debuginfo(fn, name)
    printf("Debug Information for \"%s\":\n", name)
    for k, v in pairs(debug.getinfo(fn)) do
        local display
        if type(v) == "string" then
            display = string.format("\"%s\"", v)
        else
            display = tostring(v)
        end
        -- 15 is 1 (strlen "lastlinedefined" + 1), so pad that many spaces.
        printf("\t%-15s -- %s\n", k, display)
    end
    printf("\n")
end

dump_debuginfo(printf, "printf")
dump_debuginfo(get_string, "get_string")
dump_debuginfo(print, "print")
dump_debuginfo(type, "type")
