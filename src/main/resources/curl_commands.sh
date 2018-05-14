#!/bin/bash

while getopts t: option 
do
    echo "option: ${option} and OPTIND ${OPTIND} and OPTARG ${OPTARG}"
        case $option in
            (t)
                TESTING=1
                ;;
        esac
done

shift $(($OPTIND - 1))


CURL=/usr/bin/curl
PARAMS_GET="--request GET --write-out '\n' --header 'Content-type: application/json'"
HOSTNAME=localhost
PORT=8080
ENDPOINTS=(
        "participants" 
        "meetings"
);

for i in ${ENDPOINTS[@]}
do
    COMMAND=("${CURL} ${PARAMS_GET} http://${HOSTNAME}:${PORT}/${i}")
    eval $COMMAND
done

# COMMANDS
# POST meetings:
#--------------------------------------------------
#  curl --request POST --header "Content-type: application/json" --data '{"title": "OpenShift w praktyce", "description": "wstep do Openshift", "date":"2018-05-23"}' http://localhost:8080/meetings
#  curl --request POST --header "Content-type: application/json" --data '{"title": "OpenShift for developers", "description": "Openshift w swiecie wytwarzania oprogramowania", "date":"2018-05-23"}' http://localhost:8080/meetings
# POST registration
# curl --write-out '\n'  --request POST --header "Content-type: application/json" --data '{"login":"user4", "password":"password"}' http://localhost:8080/meetings/2/registration
