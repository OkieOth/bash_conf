# prints the number of MB written to disks over the uptime
function checkDiskWrite() {
    awk '/sd/ {print $3"\t"$10 / 2 / 1024}' /proc/diskstats
}

clessFunc() {
	pygmentize -g $1 | less -R
}

clessFunc_lnr() {
	pygmentize -g -O style=colorful,linenos=1 $1 | less -R
}

a() {
    awk "{print \$$1}"
}

alias g='grep'
alias ccat='pygmentize -g'
alias ccat_lnr='pygmentize -g -O style=colorful,linenos=1a'
alias cless=clessFunc
alias cless_lnr=clessFunc_lnr
alias x='xargs'

