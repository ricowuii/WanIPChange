# WAN IP Change Informer

该项目包含两个主要的 Bash 脚本，用于监控 WAN IP 地址的变化并通过 IYUU 通知服务发送通知。

## 文件结构

### 文件说明

- `.gitattributes`: Git 属性文件，用于自动检测文本文件并执行 LF 规范化。
- `cleanlog.sh`: 用于清理日志文件并发送 IYUU 通知。
- `config.ini`: 配置文件，包含 IYUU Token。
- `function`: 包含发送 IYUU 通知和获取公网 IP 地址的函数。
- `IPs_change_informer.sh`: 用于监控 WAN IP 地址变化并发送 IYUU 通知。

## 配置

在 `config.ini` 文件中设置您的 IYUU Token：

```ini
iyuu_token=Your IYUU Token

使用方法
1. 监控 WAN IP 地址变化
运行 IPs_change_informer.sh 脚本：
