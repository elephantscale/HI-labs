#!/bin/bash

## usage:
## cluster-cmd.sh  <-h hosts_file>  [-u user]  cmd
## cluster-cmd.sh -h hosts ls -la

function usage()
{
    echo "usage : $0  -h <hosts file> [-u user] [-i ssh_key_file]  cmd"
    exit 1
}

hosts_file=
user=
cmd=
ssh_key_file="$HOME/.ssh/id_rsa"

while getopts "h:u:i:" OPTION
do
    case $OPTION in
        h)
          hosts_file=$OPTARG
          ;;

        u)
         user=$OPTARG
         ;;

        i)
         ssh_key_file=$OPTARG
         ;;
      esac
done

shift $((OPTIND-1))
cmd="$*"

if [ -z "$hosts_file" -o -z "$cmd" ] ; then
    usage
fi

if [ ! -e "$hosts_file" ] ; then
    echo "hosts file '$hosts_file' not found"
    usage
fi
if [ ! -e "$ssh_key_file" ] ; then
    echo "ssh key file file '$ssh_key_file' not found"
    usage
fi

#echo "cmd : $*"
#echo "user : $user"

user2=
if [ -n "$user" ] ; then
    user2="$user@"
fi

hosts=$(cat $hosts_file |  grep -v '#')
for host in $hosts
do
   echo "====== $host ======"
   ssh -i "$ssh_key_file" -o StrictHostKeyChecking=no  "$user2""$host" "$cmd"
   echo
done

