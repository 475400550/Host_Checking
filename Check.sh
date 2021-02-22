#!/bin/bash
echo "----------------------主机CIS安全配置情况-------------------------------"
echo "------------------------------------------------------------------------"
echo -e "\n-------------------------------------------------------------------------"
echo "1 初始设置 -> 1.1 文件系统配置 -> 1.1.1 禁用不使用的文件系统------------"
if [ "$(grep 'install cramfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（1.1.1.1）确保禁用cramfs文件系统的挂载"
else
	echo "------【未通过】（1.1.1.1）确保禁用cramfs文件系统的挂载"
fi

if [ "$(grep 'install squashfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（1.1.1.2）确保禁用squashfs文件系统的挂载"
else
	echo "------【未通过】（1.1.1.2）确保禁用squashfs文件系统的挂载"
fi

if [ "$(grep 'install udf /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（1.1.1.3）确保禁止挂载udf文件系统"
else
	echo "------【未通过】（1.1.1.3）确保禁止挂载udf文件系统"
fi

if [ "$(grep 'install freevxfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁用freevxfs文件系统的挂载"
else
	echo "------【未通过】确保禁用freevxfs文件系统的挂载"
fi

if [ "$(grep 'install jffs2 /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁用jffs2文件系统的挂载"
else
	echo "------【未通过】确保禁用jffs2文件系统的挂载"
fi

if [ "$(grep 'install hfs /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁用hfs文件系统的挂载"
else
	echo "------【未通过】确保禁用hfs文件系统的挂载"
fi

if [ "$(grep 'install hfsplus /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁用hfsplus文件系统的挂载"
else
	echo "------【未通过】确保禁用hfsplus文件系统的挂载"
fi

if [ "$(grep 'install vfat /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁止挂载udf文件系统"
else
	echo "------【未通过】确保禁止挂载udf文件系统"
fi

echo "------【（默认）未通过】确保tmp存在单独的分区"
echo "------【（默认）未通过】确保var存在单独的分区"
echo "------【（默认）未通过】确保/var/tmp存在单独的分区"

echo -e "\n-------------------------------------------------------------------------"
echo "1 初始配置 -> 1.2 配置软件更新----------------------------------"
if [ "$(grep -i gpgcheck /etc/yum.conf | grep -v '^#' |awk '{print $2}')" = "1" ];then
	echo "-----【通过】（1.2.3）确保gpgcheck已全局激活（与腾讯检测结果不同）"
else
	echo "-----【未通过】（1.2.3）确保gpgcheck已全局激活（与腾讯检测结果不同）"
fi

echo -e "\n-------------------------------------------------------------------------"
echo "1 初始配置 -> 1.4 文件系统完整性检查----------------------------------"
if["$(rpm -q aide | wc -l)" -ge 1];then
	echo "【通过】（1.4.1）确保安装了AIDE"
else
	echo "【未通过】（1.4.1）确保安装了AIDE"
fi

if["$(grep -i aide /etc/crontab | wc -l)" -ge 1];then
	echo "【通过】（1.4.2）确保定期检查文件系统完整性"
else
	echo "【未通过】（1.4.2）确保定期检查文件系统完整性"
fi

echo -e "\n-------------------------------------------------------------------------"
echo "1 初始配置 -> 1.5 加固Boot设置----------------------------------"
if["$(grep "^\s*GRUB2_PASSWORD" /boot/grub2/grub.cfg | wc -l)" -ge 1];then
	echo "【通过】（1.5.1）确保设置了bootloader密码"
else
	echo "【未通过】（1.5.1）确保设置了bootloader密码"
fi

if["$(stat /boot/grub2/grub.cfg | grep 0600 | wc -l)" -ge 1];then
	echo "【通过】（1.5.2）确保配置了bootloader配置的权限"
else
	echo "【未通过】（1.5.2）确保配置了bootloader配置的权限"
fi

echo "【（默认）未通过】确保设置了引导程序密码"

echo -e "\n-------------------------------------------------------------------------"
echo "1 初始配置 -> 1.6 额外的进程加固----------------------------------"
if [ "$(grep '* hard core 0' /etc/security/limits.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（1.6.1）确保核心转储受到限制"
else
	echo "------【未通过】（1.6.1）确保核心转储受到限制"
fi

if [ "$(grep 'kernel.randomize_va_space = 2'  /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（1.6.3）确保启用了地址空间布局随机化（ASLR）"
else
	echo "------【未通过】（1.6.3）确保启用了地址空间布局随机化（ASLR）"
fi

echo -e "\n-------------------------------------------------------------------------"
echo "1 初始配置 -> 1.8 警告标语----------------------------------"
echo "【（默认）未通过】确保正确配置本地登录警告标语"
echo "【（默认）未通过】确保正确配置远程登录警告标语"

echo -e "\n-------------------------------------------------------------------------"
echo "2 服务 -> 2.2 特殊目的的服务----------------------------------"
if [ "$(systemctl status squid | grep 'active (running)' | wc -l)"  -lt 1 ];then
	echo "------【通过】（2.2.14）确保未启用HTTP代理服务"
else
	echo "------【未通过】（2.2.14）确保未启用HTTP代理服务"
fi

echo -e "\n-------------------------------------------------------------------"
echo "3 网络配置 -> 3.4 处理不常用的网络协议----------------------------------"
if [ "$(grep 'install dccp /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（3.4.1）确保禁用DCCP"
else
	echo "------【未通过】（3.4.1）确保禁用DCCP"
fi

if [ "$(grep 'install sctp /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（3.4.2）确保已禁用SCTP"
else
	echo "------【未通过】（3.4.2）确保已禁用SCTP"
fi

if [ "$(grep 'install rds /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁用RDS"
else
	echo "------【未通过】确保禁用RDS"
fi

if [ "$(grep 'install tipc /bin/true' /etc/modprobe.d/CIS.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】确保禁用TIPC"
else
	echo "------【未通过】确保禁用TIPC"
fi

echo -e "\n-------------------------------------------------------------------------"
echo "5 认证授权及审计 -> 5.2 配置SSH服务-------------------------------------------"
if [ "$(grep -i LogLevel /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "INFO" ];then
    echo "------【通过】（5.2.5）确保SSH LogLevel设置为INFO"
else
	echo "------【未通过】（5.2.5）确保SSH LogLevel设置为INFO"
fi

if [ "$(grep -i X11Forwarding /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
    echo "------【通过】（5.2.6）确保禁用SSH X11转发"
else
	echo "------【未通过】（5.2.6）确保禁用SSH X11转发"
fi

if [ "$(grep -i MaxAuthTries /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "4" ];then
	echo "------【通过】（5.2.7）确保SSH MaxAuthTries设置为4或更低"
else
	echo "------【未通过】（5.2.7）确保SSH MaxAuthTries设置为4或更低"
fi

if [ "$(grep -i IgnoreRhosts /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "yes" ];then
    echo "------【通过】（5.2.8）确保已启用SSH IgnoreRhosts"
else
	echo "------【未通过】（5.2.8）确保已启用SSH IgnoreRhosts"
fi

if [ "$(grep -i HostbasedAuthentication /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
	echo "------【通过】（5.2.9）确保已禁用SSH基于主机的身份验证"
else
	echo "------【未通过】（5.2.9）确保已禁用SSH基于主机的身份验证"
fi

if [ "$(grep -i PermitRootLogin /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
	echo "------【通过】（5.2.10）确保禁用SSH root登录"
else
	echo "------【未通过】（5.2.10）确保禁用SSH root登录"
fi

if [ "$(grep -i PermitEmptyPasswords /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
	echo "------【通过】（5.2.11）确保已禁用SSH空密码登录"
else
	echo "------【未通过】（5.2.11）确保已禁用SSH空密码登录"
fi

if [ "$(grep -i PermitUserEnvironment /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "no" ];then
    echo "------【通过】（5.2.12）确保禁用SSH PermitUserEnvironment"
else
	echo "------【未通过】（5.2.12）确保禁用SSH PermitUserEnvironment"
fi

if [ "$(grep -i ClientAliveInterval /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "300" ];then
	if [ "$(grep -i ClientAliveCountMax /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "0" ];then
		echo "------【通过】（5.2.16）确保已配置SSH空闲超时间隔 "
	else
		echo "------【未通过】（5.2.16）确保已配置SSH空闲超时间隔 "
	fi
else
	echo "------【未通过】（5.2.16）确保已配置SSH空闲超时间隔 "
fi

if [ "$(grep -i LoginGraceTime /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "60s" ];then
    echo "------【通过】（5.2.17）确保SSH LoginGraceTime设置为一分钟或更短"
else
	echo "------【未通过】（5.2.17）确保SSH LoginGraceTime设置为一分钟或更短"
fi

echo -e "\n-------------------------------------------------------------------------"
echo "3 网络配置 -> 3.1 禁用未使用的网络协议和设备----------------------------------"
if [ "$(grep "^\s*linux" /boot/grub2/grub.cfg | grep -v ipv6.disable=1 | wc -l)"  -ge 1 ];then
	echo "------【通过】（3.1.1）确保已禁用IPv6"
else
	echo "------【未通过】（3.1.1）确保已禁用IPv6"
fi
echo -e "\n-------------------------------------------------------------------------"
echo "3 网络配置 -> 3.2 网络参数（仅限主机）----------------------------------"
if [ "$(grep 'net.ipv4.ip_forward = 0'  /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（3.2.1）确保禁用IP转发 "
else
	echo "------【未通过】（3.2.1）确保禁用IP转发"
fi

if [ "$(grep 'net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.2.2）确保禁用了发送数据包重定向"
	else
		echo "------【未通过】（3.2.2）确保禁用了发送数据包重定向"
	fi
else
	echo "------【未通过】（3.2.2）确保禁用了发送数据包重定向"
fi

echo -e "\n-------------------------------------------------------------------------"
echo "3 网络配置 -> 3.3 网络参数（主机和路由器均适用）----------------------------------"
if [ "$(grep 'net.ipv4.conf.all.accept_source_route = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.accept_source_route = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.3.1）确保不接受源路由数据包"
	else
		echo "------【未通过】（3.3.1）确保不接受源路由数据包"
	fi
else
	echo "------【未通过】（3.3.1）确保不接受源路由数据包"
fi

if [ "$(grep 'net.ipv4.conf.all.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.3.2）确保不接受ICMP重定向"
	else
		echo "------【未通过】（3.3.2）确保不接受ICMP重定向"
	fi
else
	echo "------【未通过】（3.3.2）确保不接受ICMP重定向"
fi

if [ "$(grep 'net.ipv4.conf.all.secure_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.secure_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.3.3）确保不接受secure ICMP重定向"
	else
		echo "------【未通过】（3.3.3）确保不接受secure ICMP重定向"
	fi
else
	echo "------【未通过】（3.3.3）确保不接受secure ICMP重定向"
fi

if [ "$(grep 'net.ipv4.conf.all.log_martians = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.log_martians = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.3.4）确保记录了可疑数据包"
	else
		echo "------【未通过】（3.3.4）确保记录了可疑数据包"
	fi
else
	echo "------【未通过】（3.3.4）确保记录了可疑数据包"
fi

if [ "$(grep 'net.ipv4.conf.all.rp_filter = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv4.conf.default.rp_filter = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.3.7）确保启用了反向路径过滤"
	else
		echo "------【未通过】（3.3.7）确保启用了反向路径过滤"
	fi
else
	echo "------【未通过】（3.3.7）确保启用了反向路径过滤"
fi

if [ "$(grep 'net.ipv4.tcp_syncookies = 1' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	echo "------【通过】（3.3.8）确保启用了TCP SYN Cookies"
else
	echo "------【未通过】（3.3.8）确保启用了TCP SYN Cookies"
fi

if [ "$(grep 'net.ipv6.conf.all.accept_ra = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv6.conf.default.accept_ra = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】（3.3.9）确保不接受IPv6路由器通告"
	else
		echo "------【未通过】（3.3.9）确保不接受IPv6路由器通告"
	fi
else
	echo "------【未通过】（3.3.9）确保不接受IPv6路由器通告"
fi

if [ "$(grep 'net.ipv6.conf.all.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
	if [ "$(grep 'net.ipv6.conf.default.accept_redirects = 0' /etc/sysctl.conf | wc -l)"  -ge 1 ];then
		echo "------【通过】确保不接受IPv6重定向"
	else
		echo "------【未通过】确保不接受IPv6重定向"
	fi
else
	echo "------【未通过】确保不接受IPv6重定向"
fi



if [ "$(grep -i Protocol /etc/ssh/sshd_config | grep -v '^#' |awk '{print $2}')" = "2" ];then
    echo "------【通过】确保SSH协议设置为2"
else
	echo "------【未通过】确保SSH协议设置为2"
fi


if [ "$(grep 'TMOUT=600' /etc/profile | wc -l)"  -ge 1 ];then
	echo "------【通过】（5.4.4）确保默认用户shell超时为900秒或更短"
else
	echo "------【未通过】（5.4.4）确保默认用户shell超时为900秒或更短"
fi
