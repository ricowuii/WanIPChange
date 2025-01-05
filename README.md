# WANIPCHANGE V1.0 2025-1-5更新

## 中文

### 介绍
WANIPCHANGE 是一个用于监控和通知您的 WAN IP 地址变化的工具。这对于远程访问、安全性和网络管理等各种用途都非常有用。

### 特性
- 监控 WAN IP 地址变化
- 在 IP 变化时发送通知
- 易于配置和使用

### 安装
1. 克隆仓库：
    ```bash
    git clone https://github.com/ricowuii/WanIPChange.git
    ```

### 使用
1. 在 `config.ini` 文件中配置您的通知设置。以下是一个示例配置：

    ```ini
       iyuu_token = Your IYUU Token
    ```

    将占位符替换为您的IYUU 令牌。
2. 执行IPs_change_informer.sh脚本

    ```bash
    bash IPs_change_informer.sh
    ```

    ## English

    ### Introduction
    WANIPCHANGE is a tool for monitoring and notifying you of changes in your WAN IP address. This is useful for various purposes such as remote access, security, and network management.

    ### Features
    - Monitor WAN IP address changes
    - Send notifications when the IP changes
    - Easy to configure and use

    ### Installation
    1. Clone the repository:
        ```bash
        git clone https://github.com/ricowuii/WanIPChange.git
        ```

    ### Usage
    1. Configure your notification settings in the `config.ini` file. Here is a sample configuration:

        ```ini
           iyuu_token = Your IYUU Token
        ```

        Replace the placeholder with your IYUU token.
    2. Run the IPs_change_informer.sh script

        ```bash
        bash IPs_change_informer.sh
        ```