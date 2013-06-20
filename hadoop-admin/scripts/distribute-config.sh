#!/bin/bash

function usage()
{
    echo "usage : $0  -h <hosts file> [-i ssh_key_file]"
    exit 1
}

hosts_file=
config_dir='/etc/hadoop'
ssh_key_file="$HOME/.ssh/id_rsa"

while getopts "h:u:i:" OPTION
do
    case $OPTION in
        h)
          hosts_file=$OPTARG
          ;;

        i)
         ssh_key_file=$OPTARG
         ;;
      esac
done

shift $((OPTIND-1))

if [ -z "$hosts_file" ] ; then
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


tmp_dir='tmp/config_files'

hosts=$(cat $hosts_file |  grep -v '#')
for host in $hosts
do
   echo "====== $host ======"
   #rsync -avz -e "ssh  -i \"$ssh_key_file\" -o StrictHostKeyChecking=no"  "$source" "${user2}${host}:${dest}"

   ssh  -i "$ssh_key_file" -o "StrictHostKeyChecking=no"   "${host}" "mkdir -p $tmp_dir; rm -rf ${tmp_dir}/*"
   scp -i "$ssh_key_file" -o "StrictHostKeyChecking=no"  "${config_dir}"/*   "${host}:${tmp_dir}/"
   ssh  -i "$ssh_key_file" -o "StrictHostKeyChecking=no"   "${host}" "sudo cp ${tmp_dir}/* ${config_dir}; rm -rf ${tmp_dir}" 
   echo
done

