#!/bin/bash

# 设置脚本所在目录
script_dir=$(dirname $0)

#导入发送IYUU函数
source $script_dir/send_iyuu.fun


#ipv6网口名称
network_wan="ovs_eth0"
#iyuu标题
iyuu_text="DS918WANIPChanged"
#iyuu token
iyuu_token="IYUU57489Te561fae2c57115d2c158d0438a6df163453b8b51"
#存储IPv6地址的文件
wan_ip="$script_dir/wan_ip.txt"
#脚本执行log文件
exc_log="$script_dir/check_wan_ip.log"
#如果只需要获取WAN口的IPv4地址，就把获取WAN口IPv6地址的相关命令删掉
#只需要获取WAN口的IPv6地址的同理
# 获取当前的 WAN IPv6 地址
current_ipv6=$(ip -6 addr show $network_wan | grep -oE 'inet6 [0-9a-fA-F:]+(/[0-9]+)?' | awk '{print $2}'|head -n 1)
# 检查 wan_ip.txt 文件是否存在，如果不存在则创建文件并发送初始邮件
if [ ! -f $wan_ip ]; then
echo "ipv6_wan: $current_ipv6" > $wan_ip

# 发送初始邮件通知
#echo -e "Subject: OpenWRT WAN IP\n\nFirst running script，WAN IPv4 address: $current_ipv4\nWAN IPv6 address: $current_ipv6_wan \nLAN IPv6 address:$current_ipv6_lan"| msmtp -a default 18918818857@189.cn
echo "Script executed at $(date)">> $exc_log
fi
# 读取已保存的 IP 地址
saved_ip=$(cat $wan_ip)
# 如果当前的 IPv4 或 IPv6 地址与保存的不一致，发送邮件通知并更新记录
if [ "ipv6_wan: $current_ipv6" != "$saved_ip" ]; then
#echo -e "Subject: OpenWRT WAN IP Changed\n\nWAN IPv4 changed to: $current_ipv4\nWAN IPv6 changed to : $current_ipv6_wan\nLAN IPv6 changed to : $current_ipv6_lan\n Former IP address: $saved_ip" | msmtp -a default 18918818857@189.cn
iyuu_desp="WAN IPv6 changed to : $current_ipv6 \
Former IP address: $saved_ip"
response=$(send_iyuu "$iyuu_text" "$iyuu_desp" "$iyuu_token")
# 更新 IP 记录
echo "ipv6_wan: $current_ipv6" > $wan_ip
echo "$(date) Script executed at $(date) WAN IP has changed">> $exc_log
echo "$(date) $response">> $exc_log
else
echo "$(date) WAN IP does not changed.WAN IPV6 address:$current_ipv6">> $exc_log
fi

