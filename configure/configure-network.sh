#!/bin/bash

while test $# -gt 0; do
        case "$1" in
                -h|--help)
                        echo "Configure Network Settings"
                        echo " "
                        echo "options:"
                        echo "-h, --help                This help menu"
                        echo "-a, --addr=               Set IP address"
                        echo "-d, --dns=                Set System DNS"
                        echo "-g, --gw=                 Set GateWay"
                        echo "-n, --name=               Set System HostName"
                        exit 0
                        ;;
                -a)
                        shift
                        if test $# -gt 0; then
                                export PROCESS=$1
                        else
                                echo "no ip specified"
                                exit 1
                        fi
                        shift
                        ;;
                --addr*)
                        export PROCESS=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -d)
                        shift
                        if test $# -gt 0; then
                                export PROCESS=$1
                        else
                                echo "no process specified"
                                exit 1
                        fi
                        shift
                        ;;
                --dns*)
                        export PROCESS=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -o)
                        shift
                        if test $# -gt 0; then
                                export OUTPUT=$1
                        else
                                echo "no output dir specified"
                                exit 1
                        fi
                        shift
                        ;;
                --output-dir*)
                        export OUTPUT=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done
