function fish_right_prompt
    set -g git_showdirtystate 1
    set -g git_showuntrackedfiles 1
    set -g git_showupstream informative
    set -g git_showcolorhints 1
    set -g git_use_informative_chars 1

    # Unfortunately this only works if we have a sensible locale
    string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
    and set -g git_char_dirtystate \U1F4a9
    set -g git_char_untrackedfiles "?"

    set -l txt_status ""
    if test $last_status -ne 0
      set -a txt_status "[38;2;235;111;146m[48;2;235;111;146m[38;2;38;35;58m "
      set -a txt_status $last_status
      set -a txt_status "[0m[38;2;235;111;146m[0m"
    end

    # The git prompt's default format is ' (%s)'.
    # We don't want the leading space.
    set -l vcs (fish_vcs_prompt '[38;2;246;193;119m[48;2;246;193;119m[38;2;38;35;58m󰊢 %s [0m[38;2;246;193;119m[0m' 2>/dev/null)

    string join " " --  $txt_status $vcs
end
