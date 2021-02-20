#!/bin/bash
if [ "$(grep "ucredit = -1" /etc/security/pwquality.conf | grep -v '^#' | wc -l)" != 1 ];then
	echo "口令复杂度满足要求"
else
	echo "失败"
fi
