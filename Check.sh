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
	echo "【通过】确保禁用hfs文件系统的挂载 "
else
	echo "【未通过】确保禁用hfs文件系统的挂载 "
fi

if [ "$(grep 'install hfsplus /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用hfsplus文件系统的挂载 "
else
	echo "【未通过】确保禁用hfsplus文件系统的挂载 "
fi

if [ "$(grep 'install udf /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁止挂载udf文件系统"
else
	echo "【未通过】确保禁止挂载udf文件系统"
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

if [ "$(grep -i PermitUserEnvironment /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
    echo "【通过】确保禁用SSH PermitUserEnvironment"
else
	echo "【未通过】确保禁用SSH PermitUserEnvironment"
fi

if [ "$(grep -i LoginGraceTime /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "60s" ];then
    echo "【通过】确保SSH LoginGraceTime设置为一分钟或更短"
else
	echo "【未通过】确保SSH LoginGraceTime设置为一分钟或更短"
fi

if [ "$(grep -i IgnoreRhosts /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "yes" ];then
    echo "【通过】确保已启用SSH IgnoreRhosts"
else
	echo "【未通过】确保已启用SSH IgnoreRhosts"
fi

if [ "$(grep -i X11Forwarding /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
    echo "【通过】确保禁用SSH X11转发"
else
	echo "【未通过】确保禁用SSH X11转发"
fi

if [ "$(grep -i LogLevel /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "INFO" ];then
    echo "【通过】确保SSH LogLevel设置为INFO"
else
	echo "【未通过】确保SSH LogLevel设置为INFO"
fi

if [ "$(grep -i ClientAliveInterval /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "300" ];then
    echo "【通过】确保已配置SSH空闲超时间隔 "
else
	echo "【未通过】确保已配置SSH空闲超时间隔 "
fi

if [ "$(grep -i ClientAliveCountMax /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "0" ];then
    echo "【通过】确保已配置SSH空闲超时间隔 "
else
	echo "【未通过】确保已配置SSH空闲超时间隔 "
fi

if [ "$(grep -i test /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "0" ];then
    echo "【通过】test "
else
	echo "【未通过】gresr "
fi
