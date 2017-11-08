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
                                export ipaddr=$1
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
                                export dnslist=$1
                        else
                                echo "no dns specified"
                                exit 1
                        fi
                        shift
                        ;;
                --dns*)
                        export dnslist=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -g)
                        shift
                        if test $# -gt 0; then
                                export gw=$1
                        else
                                echo "no gateway specified"
                                exit 1
                        fi
                        shift
                        ;;
                --gw*)
                        export gw=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -n)
                        shift
                        if test $# -gt 0; then
                                export hostname=$1
                        else
                                echo "no hostname specified"
                                exit 1
                        fi
                        shift
                        ;;
                --name*)
                        export hostname=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done

/usr/local/sf/bin/sfcli.pl configure dns $dnslist
/usr/local/sf/bin/sfcli.pl configure_hostname dns $hostname
/usr/local/sf/bin/sfcli.pl configure_ipv4 network man $ipaddr $netmask $gw
