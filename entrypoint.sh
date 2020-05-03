#! /bin/sh 

endpoint() {
    curl --max-time 30 --no-buffer -s --unix-socket /var/run/docker.sock "$@" || return 1
    return 0
}
while true; do
    sleep 5
    endpoint "http://localhost/containers/json?filters=\{\"health\":\[\"unhealthy\"\]\}" | \
    jq -r "foreach .[] as \$CONTAINER([];[]; \$CONTAINER | .Id, .Names[0] )" | \
    while read -r CONTAINER_ID && read -r CONTAINER_NAME; do
        if [ "null" != "$CONTAINER_NAME" ] && [ -f "/scripts$CONTAINER_NAME.sh" ]; then
            echo "Unhealthy container found. Running script for $CONTAINER_NAME"
            /scripts$CONTAINER_NAME.sh
        fi
    done
done