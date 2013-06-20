#!/bin/bash
function usage()
{
    echo "usage : $0  -h <slave hosts file>"
    exit 1
}

hosts_file=
while getopts "h:u:i:" OPTION
do
    case $OPTION in
        h)
          hosts_file=$OPTARG
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


# stop mapred
sudo service hadoop-jobtracker stop
./cluster-cmd.sh -h "${hosts_file}" "sudo service hadoop-tasktracker stop"

# stop hdfs
sudo service hadoop-namenode stop
./cluster-cmd.sh -h "${hosts_file}" "sudo service hadoop-datanode stop"
