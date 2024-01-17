local tr = aegisub.gettext

script_name = tr"Quotation Swapper"
script_description = tr"Change straight quotation marks to Polish double quotes"
script_author = "Yuuki"
script_version = "1.0"

function swap_quotation_marks(subs, sel)
    local is_opening = true

    for _, i in ipairs(sel) do
        local line = subs[i]
        line.text = line.text:gsub('"', function(match)
            is_opening = not is_opening
            return is_opening and "”" or "„"
        end)
        subs[i] = line
    end

    aegisub.set_undo_point(tr"Quotation Swap")
end

aegisub.register_macro(script_name, script_description, swap_quotation_marks)
