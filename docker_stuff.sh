function docker_info_base() {


docker ps | sed -r 's-^[a-z0-9]*\W*([a-z0-9\.:]*)\W.*\W([a-z0-9_]*)$-C_R: \2 \-> \1-' | tail -n +2 | sed -e 's-#-\\-g'| awk '{print "\033[1;32m"$0"\033[0m"}';\
docker ps -a | grep Exited | sed -r 's-^[a-z0-9]*\W*([a-z0-9\.:]*)\W.*\W([a-z0-9_]*)$-C_H: \2 \-> \1-' | sed -e 's-#-\\-g'| awk '{print "\033[1;36m"$0"\033[0m"}';\
docker images | awk '{print "\033[1;34mIMG: "$1":"$2" \033[0m"}' | tail -n +2
}

function docker_info() {
    if [ $# -gt 0 ]; then
        docker_info_base | grep $1
    else
        docker_info_base
    fi
}
