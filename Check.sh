#!/bin/bash
if [ "$(grep 'install cramfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "安装了cramfs"
else
	echo "未安装"
fi
