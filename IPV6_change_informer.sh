#!/bin/bash

# 设置脚本所在目录
script_dir=$(dirname $0)

#导入发送IYUU函数
source $script_dir/function

#iyuu标题
iyuu_text="$(uname -n)WANIPChanged"
#iyuu token
iyuu_token="IYUU57489Te561fae2c57115d2c158d0438a6df163453b8b51"
#存储IP地址的文件
wan_ip="$script_dir/wan_ip.txt"
#脚本执行log文件
exc_log="$script_dir/check_wan_ip.log"


# 调用get_global_ips函数，获取所有公网IP
current_ip="$(get_global_ips)"
# 检查 wan_ip.txt 文件是否存在，如果不存在则创建文件并发送IYUU通知
if [ ! -f $wan_ip ]; then
echo "$current_ip" > $wan_ip
# 设置IYUU通知内容
iyuu_desp=$(echo -e "$(date) \n \
WAN IPs are: \n  \
$current_ip")
# 发送IYUU通知
response=$(send_iyuu "$iyuu_text" "$iyuu_desp" "$iyuu_token")
# 记录log
echo "$(date) IPs are written in file $wan_ip">> $exc_log
echo "$(date) $response">> $exc_log
fi

# 读取已保存的 IP 地址
saved_ip=$(cat $wan_ip)
# 如果当前的IP地址与保存的不一致，发送IYUU并更新记录
if [ "$current_ip" != "$saved_ip" ]; then
#设置IYUU通知内容
iyuu_desp=$(echo -e "$(date) \n \
WAN IPs changed to :\n \
$current_ip \n \
Former IPs address: \n \
$saved_ip")
#发送IYUU通知
response=$(send_iyuu "$iyuu_text" "$iyuu_desp" "$iyuu_token")
# 更新IP记录文件为最新的IP地址
echo "$current_ip" > $wan_ip
# 更新事件记录log
echo "$(date) Script executed at $(date) WAN IP has changed">> $exc_log
echo "$(date) $response">> $exc_log
else
# 未更新，执行记录记录Log
echo "$(date) WAN IP does not changed.WAN IPs address:$current_ip">> $exc_log
fi