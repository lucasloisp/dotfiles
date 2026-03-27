function fish_right_prompt -d "Snorin - oh-my-zsh sorin inspired prompt - right side"
    set -l last_status $status

    # use this to DRY up some code
    function print_symbol
        printf '%s ' (set_color $argv[1])$argv[2]
        set_color normal
    end

    # last status
    if not test $last_status -eq 0
        # some users might find the actual code more helpful than
        # some random symbol ported from another shell
        if set -q snorin_show_error_code
            print_symbol red (printf '[%s]' $last_status)
        else
            print_symbol red ⏎
        end
    end
end
