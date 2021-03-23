#!/bin/bash
# Bootstrap machine

change_docker_path() {
    # 
    sudo rsync -aP /var/lib/docker/ /mnt/storage/docker
    sudo mv /var/lib/docker /var/lib/docker.old
}

main() {
    change_docker_path
}

main