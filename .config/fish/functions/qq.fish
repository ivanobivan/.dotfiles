function qq
    set help_dir ~/workspace/dotfiles/help

    if test (count $argv) -eq 0
        ls $help_dir/*.md 2>/dev/null | string replace -r '.*/|\.md$' ''
        return 1
    end

    cat $help_dir/$argv[1].md
end
