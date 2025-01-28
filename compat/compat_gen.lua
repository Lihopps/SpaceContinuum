local compat={}


function compat.update()
    if mods["maraxsis"] then
        require("compat.maraxsis")
    end

end


return compat