#!/bin/bash
echo "------------------------------------------------------"
if [ "$(grep 'install cramfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用cramfs文件系统的挂载"
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
	if [ "$(grep -i ClientAliveCountMax /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "0" ];then
		echo "【通过】确保已配置SSH空闲超时间隔 "
	else
		echo "【未通过】确保已配置SSH空闲超时间隔 "
	fi
else
	echo "【未通过】确保已配置SSH空闲超时间隔 "
fi

if [ "$(grep 'net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保禁用了数据包重定向发送"
	else
		echo "【未通过】确保禁用了数据包重定向发送"
	fi
else
	echo "【未通过】确保禁用了数据包重定向发送"
fi


if [ "$(grep 'net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用了数据包重定向发送"
	else
		echo "【未通过】确保禁用了数据包重定向发送"
	fi	
else
	echo "【未通过】确保禁用了数据包重定向发送"
fi

if [ "$(grep 'net.ipv4.conf.all.accept_source_route = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.accept_source_route = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保不接受源路由数据包"
	else
		echo "【未通过】确保不接受源路由数据包"
	fi
else
	echo "【未通过】确保不接受源路由数据包"
fi

if [ "$(grep 'net.ipv4.conf.all.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保不接受ICMP重定向"
	else
		echo "【未通过】确保不接受ICMP重定向"
	fi
else
	echo "【未通过】确保不接受ICMP重定向"
fi

if [ "$(grep 'net.ipv4.conf.all.secure_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.secure_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保不接受secure ICMP重定向"
	else
		echo "【未通过】确保不接受secure ICMP重定向"
	fi
else
	echo "【未通过】确保不接受secure ICMP重定向"
fi

if [ "$(grep 'net.ipv4.conf.all.log_martians = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.log_martians = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保记录了可疑数据包"
	else
		echo "【未通过】确保记录了可疑数据包"
	fi
else
	echo "【未通过】确保记录了可疑数据包"
fi

if [ "$(grep 'net.ipv4.conf.all.rp_filter = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.rp_filter = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保启用了反向路径过滤"
	else
		echo "【未通过】确保启用了反向路径过滤"
	fi
else
	echo "【未通过】确保启用了反向路径过滤"
fi

if [ "$(grep 'net.ipv6.conf.all.accept_ra = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv6.conf.default.accept_ra = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保不接受IPv6路由器通告"
	else
		echo "【未通过】确保不接受IPv6路由器通告"
	fi
else
	echo "【未通过】确保不接受IPv6路由器通告"
fi

if [ "$(grep 'net.ipv6.conf.all.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv6.conf.default.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "【通过】确保不接受IPv6重定向"
	else
		echo "【未通过】确保不接受IPv6重定向"
	fi
else
	echo "【未通过】确保不接受IPv6重定向"
fi


if [ "$(grep '* hard core 0' /etc/security/limits.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保核心转储受到限制"
else
	echo "【未通过】确保核心转储受到限制"
fi

if [ "$(grep 'kernel.randomize_va_space = 2'  /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保启用了地址空间布局随机化（ASLR）"
else
	echo "【未通过】确保启用了地址空间布局随机化（ASLR）"
fi

if [ "$(grep 'net.ipv4.ip_forward = 0'  /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保禁用IP转发 "
else
	echo "【未通过】确保禁用IP转发"
fi

if [ "$(grep 'net.ipv4.tcp_syncookies = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "【通过】确保启用了TCP SYN Cookies"
else
	echo "【未通过】确保启用了TCP SYN Cookies"
fi

if [ "$(grep -i Protocol /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "2" ];then
    echo "【通过】确保SSH协议设置为2"
else
	echo "【未通过】确保SSH协议设置为2"
fi

if [ "$(grep -i MaxAuthTries /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "4" ];then
	echo "【通过】确保SSH MaxAuthTries设置为4或更低"
else
	echo "【未通过】确保SSH MaxAuthTries设置为4或更低"
fi

if [ "$(grep -i HostbasedAuthentication /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
	echo "【通过】确保已禁用SSH基于主机的身份验证"
else
	echo "【未通过】确保已禁用SSH基于主机的身份验证"
fi

if [ "$(grep -i PermitEmptyPasswords /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
	echo "【通过】确保已禁用SSH空密码登录"
else
	echo "【未通过】确保已禁用SSH空密码登录"
fi

if [ "$(grep 'TMOUT=600' /etc/profile | wc -l)"  -ge 1 ];then
	echo "【通过】确保默认用户shell超时为900秒或更短"
else
	echo "【未通过】确保默认用户shell超时为900秒或更短"
fi
