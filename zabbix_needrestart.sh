#!/bin/bash

fail() {
    echo "$*" 1>&2
    exit 1
}

usage() {
    fail "usage: $0 (kernel-expected|kernel-current|services)"
    exit 1
}

[ $# -lt 1 ] && usage

case "$1" in
kernel-expected)
    [ $# -ne 1 ] && usage
    DEBIAN_FRONTEND=readline needrestart -r l -b | grep NEEDRESTART-KEXP | awk '{print $2}'
    ;;

kernel-current)
    [ $# -ne 1 ] && usage
    DEBIAN_FRONTEND=readline needrestart -r l -b | grep NEEDRESTART-KCUR | awk '{print $2}'
    ;;

services)
    [ $# -ne 1 ] && usage
    DEBIAN_FRONTEND=readline needrestart -r l -b | grep NEEDRESTART-SVC | awk '{print $2}'
    ;;

*)
    usage
    ;;
esac
