function Prequire(...)  -- https://stackoverflow.com/questions/34965863/lua-require-fallback-error-handling
    local status, lib = pcall(require, ...)
    if status then
        -- print("Successfully loaded '" .. ... .. "'\n")
        return lib
    else
        print("WARNING: Failed to load '" .. ... .. "'\n")
        return nil
    end
end

require('remylau')
