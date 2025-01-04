#发送IYUU通知
#参数1：通知标题（不可有空格、特殊字符）；参数2：通知内容；参数3：IYUU token
#调用函数，参数是变量，需要加双引号
send_iyuu () {
    local text_param="$1"
    local desp_param="$2"
    local target_url_param="$3"
    curl -s -X POST -d "text=$text_param&desp=$desp_param" https://iyuu.cn/$target_url_param.send
}