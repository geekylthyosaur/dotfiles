if status is-interactive
	set fish_greeting
    fish_vi_key_bindings
    bind -M insert \e\r accept-autosuggestion execute
end

