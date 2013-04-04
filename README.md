Github Command Line
===================

Useful couple of scripts to handle git commandline on mac

Features
* Git Auto complete by tabbing
* Colored prompt detailing (for git dirs)
  * Time since last commit
  * Name of current branch
  * Uncommitted changes

Prompt example (in Scripts dir, 9 minutes since last commit, on branch master, uncommited changes)
```
kardinois@acac0f47:Scripts (9m|master+) $ 
```


Don't forget to update bashrc to include
```
. ${HOME}/Scripts/bash_functions
. ${HOME}/Scripts/bash_colors
PROMPT_COMMAND=my_prompt                           
```

And a useful alias to neaten up the output from git log
```
alias 'gitprettylog=git log --pretty=format:"%h - %an, %ar : %s"'
```

Have fun!
