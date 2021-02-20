#!/bin/bash
if [ "$(grep 'install cramfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保已禁用cramfs文件系统的挂载"
else
	echo "【未通过】确保已禁用cramfs文件系统的挂载"
fi

if [ "$(grep 'install freevxfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用freevxfs文件系统的挂载"
else
	echo "【未通过】确保禁用freevxfs文件系统的挂载"
fi

if [ "$(grep 'install jffs2 /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用jffs2文件系统的挂载"
else
	echo "【未通过】确保禁用jffs2文件系统的挂载"
fi

if [ "$(grep 'install hfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】 	确保禁用hfs文件系统的挂载 "
else
	echo "【未通过】 	确保禁用hfs文件系统的挂载 "
fi

if [ "$(grep 'install hfsplus /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】 	确保禁用hfsplus文件系统的挂载 "
else
	echo "【未通过】 	确保禁用hfsplus文件系统的挂载 "
fi

if [ "$(grep 'install udf /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】 	确保禁止挂载udf文件系统"
else
	echo "【未通过】 	确保禁止挂载udf文件系统"
fi

if [ "$(grep 'install squashfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用squashfs文件系统的挂载"
else
	echo "【未通过】确保禁用squashfs文件系统的挂载"
fi

if [ "$(grep 'install vfat /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁止挂载udf文件系统 "
else
	echo "【未通过】确保禁止挂载udf文件系统 "
fi

if [ "$(grep 'install dccp /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用DCCP"
else
	echo "【未通过】确保禁用DCCP"
fi

if [ "$(grep 'install sctp /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保已禁用SCTP"
else
	echo "【未通过】确保已禁用SCTP"
fi

if [ "$(grep 'install rds /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用RDS"
else
	echo "【未通过】确保禁用RDS"
fi

if [ "$(grep 'install tipc /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用TIPC"
else
	echo "【未通过】确保禁用TIPC"
fi
