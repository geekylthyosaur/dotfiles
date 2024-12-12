fish_add_path ~/.local/bin

if status is-interactive
    set fish_greeting

    alias tree="tree --dirsfirst"
end

function fish_greeting; end
function fish_right_prompt; end
