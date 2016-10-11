function docker_active_cont_base() {
    docker ps | sed -r 's-^[a-z0-9]*\W*([a-zA-Z0-9\.:_\/-]*)\W.*\s([a-zA-Z0-9\._-]*)$-C_R: \2 \-> \1-' | tail -n +2 | sed -e 's-#-\\-g'| awk '{print "\033[1;32m"$0"\033[0m"}'
}

function docker_cont_base() {
    docker_active_cont_base; \
    docker ps -a | grep Exited | sed -r 's-^[a-zA-Z0-9]*\W*([a-zA-Z0-9\.:_\/-]*)\W.*\s([a-zA-Z0-9\._-]*)$-C_H: \2 \-> \1-' | sed -e 's-#-\\-g'| awk '{print "\033[1;36m"$0"\033[0m"}';\
}

function docker_images_base() {
    docker images | awk '{print "\033[1;34mIMG: "$1":"$2" \033[0m"}' | tail -n +2
}

function docker_info_base() {
    docker_cont_base; \
    docker_images_base
}

    

function docker_info() {
    if [ $# -gt 0 ]; then
        docker_info_base | grep $1
    else
        docker_info_base 
    fi
}

function docker_cont() {
    if [ $# -gt 0 ]; then
        docker_cont_base | grep $1
    else
        docker_cont_base
    fi
}

function docker_active_cont() {
    if [ $# -gt 0 ]; then
        docker_active_cont_base | grep $1
    else
        docker_active_cont_base
    fi
}

function docker_images() {
    if [ $# -gt 0 ]; then
        docker_images_base | grep $1
    else
        docker_images_base
    fi
}

alias _dca='docker_active_cont'
alias _dc='docker_cont'
alias _da='docker_info'
alias _di='docker_images'
