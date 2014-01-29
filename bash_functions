source git-completion.bash

minutes_since_last_commit() {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

git_prompt() {
            local g="$(__gitdir)"
            if [ -n "$g" ]; then
                local edits=$(git status -s | wc -l)
                if [ "$edits" -gt 0 ]; then
                    edits="+"
                else
                    edits=""
                fi
                local delta=`minutes_since_last_commit`
                if [ "$delta" -gt $((60 * 24 * 7)) ]; then
                    delta="${NORMAL}>1wk${NORMAL}" 
                elif [ "$delta" -gt $((60 * 24)) ]; then
                    delta="${VIOLET}$((delta/60/24))d${NORMAL}" 
                elif [ "$delta" -gt 60 ]; then
                    delta="${RED}$((delta/60))h${NORMAL}"
                elif [ "$delta" -gt 10 ]; then
                    delta="${YELLOW}${delta}m${NORMAL}"
                else
                    delta="${GREEN}${delta}m${NORMAL}"
                fi
                local branch="$(git symbolic-ref HEAD 2>/dev/null)";
                GIT_PROMPT="(${delta}|${GREEN}${branch##refs/heads/}${edits}${RESET})"
            else
                GIT_PROMPT=""
            fi
        }


 my_prompt() {
            git_prompt
            eval "PS1=\"\${CYAN}\u\${RESET}@\${VIOLET}\h:${RESET}\W \"'${GIT_PROMPT//\'/\'\\\'\'} $ '"
        }
