#!/bin/bash

# IYUU函数和Log文件所在文件夹
script_dir=$(dirname $0)


#导入发送IYUU函数
source $script_dir/send_iyuu.fun

#iyuu标题
iyuu_text="$(hostname)cleanlog"
#iyuu token
iyuu_token="IYUU57489Te561fae2c57115d2c158d0438a6df163453b8b51"

# 定义要监控的文件路径，可根据实际情况修改
file_path="$script_dir/check_wan_ip.log"

# 定义文件大小阈值，单位为字节，这里假设阈值为10M，可按需调整
threshold_size=1048576

#设置保留文件行数
file_row=120
# 获取文件当前大小
current_size=$(du -b "$file_path" | cut -f1)

# 判断文件大小是否超过阈值
if [ "$current_size" -gt "$threshold_size" ]; then
    # 使用tail命令保留最近30行内容到临时文件
    tail -n $file_row "$file_path" > "$file_path.tmp"
    # 将临时文件覆盖原文件，实现清空并保留最近30行
    mv "$file_path.tmp" "$file_path"
    # 设置IYUU发送内容
    iyuu_desp_clean="$(date) 文件 $file_path 大小为 $current_size 已超过指定大小 $threshold_size，已清空并保留最近 $file_row 行。"
    # 执行IYUU消息发送
    response=$(send_iyuu "$iyuu_text" "$iyuu_desp_clean" "$iyuu_token")
    # 记录Log
    echo "$iyuu_desp_clean" >>$file_path 
    echo "$(date) $response">> $file_path
else
    # 设置IYUU发送内容
    iyuu_desp_no_clean="$(date) 文件 $file_path 大小为 $current_size 未超过指定大小 $threshold_size，不执行清理。"
    # 执行IYUU消息发送
    response=$(send_iyuu "$iyuu_text" "$iyuu_desp_no_clean" "$iyuu_token")
    # 记录Log
    echo "$iyuu_desp_no_clean" >>$file_path
    echo "$(date) $response" >> $file_path
fi