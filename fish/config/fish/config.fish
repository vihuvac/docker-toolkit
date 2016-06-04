### Global Variables ###
set code_path /var/www
### End Global Variables ###


### Transports ###
function coding
    cd {$code_path}/
end
### End Transports ###


### Config Shortcuts ###
function editgit
    vim ~/.gitconfig
end

function editfish
    vim ~/.config/fish/config.fish
end

function edithosts
    sudo vim /etc/hosts
end

function editvim
    vim ~/.vimrc
end
### End Config Shortcuts ###


### Misc Helpers ###
function g
    grep -r $argv[1] *
end

function pyserve
    python -m "SimpleHTTPServer" $argv[1]
end
### End Misc Helpers ###


### Fish Specific ###
function fish_prompt -d "Write out the prompt"
    set_color purple
        set branch (git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ \1 /")
        printf "%s@%s%s %s%s%s%s> " (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color yellow) (echo $branch) (set_color normal)
end
### End Fish Specific ###


### Vim ###
function vim -d "Vi improved"
    set old_shell $SHELL
    set SHELL /bin/sh
    command vim $argv
    set SHELL $old_shell
end

function vi -d "Vi improved"
    vim $argv
end
### End Vim ###
