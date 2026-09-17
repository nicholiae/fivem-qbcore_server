exports("OverrideMethod", function(name, cb)
    Utils[name] = cb
end)

exports("HasActivePet", function(src)
    return Data.pets["src_" .. _src] or false
end)
