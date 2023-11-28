

function fish_prompt --description 'Write out the prompt'
  set -g -x last_status $status

  set -l prompt_mode ""
    switch $fish_bind_mode
      case default
        set prompt_mode "󰬕"
      case insert
        set prompt_mode "󰬐"
      case visual
        set prompt_mode "󰬝"
      case replace
        set prompt_mode "󰬙"
      case command
        set prompt_mode "󰬊"
      case '*'
        set prompt_mode ""
    end


    printf "  \033[38;2;49;116;143m\033[48;2;49;116;143m\033[38;2;156;207;216m"

    printf "\033[48;2;156;207;216m\033[38;2;38;35;58m\033[1m %s\033[0m\033[48;2;116;143m\033[38;2;156;207;216m\033[48;2;49;116;143m" \
      $prompt_mode

    printf "\033[38;2;224;222;224m 󰟀 %s \033[48;2;196;167;231m\033[38;2;49;116;143m" \
      (hostname)

    printf "\033[38;2;33;32;46m  %s \033[48;2;235;188;186m\033[38;2;196;167;231m" \
      (whoami)
    
    printf "\033[38;2;38;35;58m  %s \033[0m\033[38;2;235;188;186m\033[0m" \
      (prompt_pwd)

    set -l normal (set_color normal)

    # set -q fish_prompt_pwd_dir_length
    # or set -lx fish_prompt_pwd_dir_length 0

    set -l suffix '󰬪 '
    if functions -q fish_is_root_user; and fish_is_root_user
        set suffix '󰰟 '
    end

    printf "\n"
    echo -n -s $suffix $normal
end
