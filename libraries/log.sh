#!/usr/bin/env bash
#
# Logging Library

# Color palette
RESET='\033[0m'
GREEN='\033[38;5;2m'
RED='\033[38;5;1m'
YELLOW='\033[38;5;3m'

# Functions

########################
# Log message to stderr
# Arguments:
#   $1 - Message to log
#########################
log::log() {
    printf "%b\\n" "${*}" >&2
}

########################
# Log info message
# Arguments:
#   $1 - Message to log
#########################
log::info() {
    log::log "${GREEN}INFO ${RESET} ==> ${*}"
}

########################
# Log warning message
# Arguments:
#   $1 - Message to log
#########################
log::warn() {
    log::log "${YELLOW}WARN ${RESET} ==> ${*}"
}

########################
# Log error message
# Arguments:
#   $1 - Message to log
#########################
log::error() {
    log::log "${RED}ERROR ${RESET} ==> ${*}"
}

########################
# Log start message of script
# Helpful for logs to know when they start in airflow
# Arguments:
#   $1 - Message to log
#########################
log::start() {
    log::log "${GREEN}####################################################################"
    log::log "${GREEN}########## STARTING SCRIPT $1 ##########"
    log::log "${GREEN}#### Started script on $(TZ="Australia/Sydney" date) #####"
    log::log "${GREEN}####################################################################"
}

########################
# Log that will print each param
# Helpful for logs - print key value pairs.
# Arguments:
#   $@ - Params to print back "value=$value"
#########################
log::params() {
    params=("$@")
    for param in "${params[@]}"; do
        log::info "${param}"
    done
}

########################
# Log function starting
# Arguments:
#   $1 - Message to log
#########################
log::function() {
    log::log "${GREEN}INFO ${RESET} ==> Starting function ${FUNCNAME[1]}"
}
