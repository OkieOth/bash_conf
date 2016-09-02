# prints the number of MB written to disks over the uptime
function checkDiskWrite() {
    awk '/sd/ {print $3"\t"$10 / 2 / 1024}' /proc/diskstats
}

alias g='grep'
