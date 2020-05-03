#! /bin/sh 

endpoint() {
    curl --max-time 30 --no-buffer -s --unix-socket /var/run/docker.sock "$@" || return 1
    return 0
}

while true; do
    sleep 5
    endpoint "http://localhost/containers/json?filters=\{\"health\":\[\"unhealthy\"\]${labelFilter}\}"
done