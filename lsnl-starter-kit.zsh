export EDITOR="emacs -nw"
alias mk="mkdir -m 777"

function kgproxy() {
    export http_proxy=proxy.kwansei.ac.jp:8080
    export https_proxy=proxy.kwansei.ac.jp:8080
    export ftp_proxy=proxy.kwansei.ac.jp:8080
}

function unsetproxy() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
}

function fserv-rsync() {
    rsync -avzP fserv:/share/meeting/ ~/fserv/meeting
    rsync -avzP fserv:/share/seminar/ ~/fserv/seminar
    rsync -avzP fserv:/share/workshop/ ~/fserv/workshop
    rsync -avzP fserv:/share/math-bof/ ~/fserv/math-bof
}

function fserv-fzf() {
    local today_dir_name=$(date +"%y%m%d")
    local selected_meeting_dir=$(find ~/fserv -type d | grep $today_dir_name | fzf)

    if [ -n "$selected_meeting_dir" ]; then
        BUFFER="cd $selected_meeting_dir"
        zle accept-line
    fi
    zle reset-prompt
}

zle -N fserv-fzf
bindkey "^u" fserv-fzf
