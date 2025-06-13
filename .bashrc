#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias save='/home/jas/Scripts/backup/save.sh'
alias backup='/home/jas/Scripts/backup/backup.sh'
alias formatBackground='/home/jas/Scripts/background-name.sh'

# rc.lua alias
alias rclua='cd /home/jas/.config/awesome/;vim /home/jas/.config/awesome/rc.lua'
alias rcogb='cp /home/jas/.config/awesome/rc.lua /home/jas/.config/awesome/rc.lua.og'
alias rcogr='cp /home/jas/.config/awesome/rc.lua.og /home/jas/.config/awesome/rc.lua'
alias rcwipb='cp /home/jas/.config/awesome/rc.lua /home/jas/.config/awesome/rc.lua.wip'
alias rcwipr='cp /home/jas/.config/awesome/rc.lua.wip /home/jas/.config/awesome/rc.lua'

# bashrc editing
alias reload='source ~/.bashrc && echo "Reloaded ~/.bashrc"'
alias rcbash='vim ~/.bashrc'

# firefox editing
alias rcff='cd /home/jas/.mozilla/firefox/8vxid4gp.default-release/chrome;vim /home/jas/.mozilla/firefox/8vxid4gp.default-release/chrome'

# script helper
alias ms='/home/jas/Scripts/script-helper/make-script.sh'
alias mg='/home/jas/Scripts/script-helper/make-group.sh'

# monitor setup
alias mirmon='/home/jas/Scripts/monitor/mirror-monitor.sh'
alias pomo='/home/jas/Scripts/time-management/pomodoro.sh'

export MOZ_USE_XINPUT2=1

