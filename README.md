# Singbox-Install

### 首次运行(Go环境安装)

```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/go_install.sh | bash
```
### 安装

编译安装:

```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/compile_install.sh | bash
```

安装:

```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/install.sh | bash
```

最小化编译安装:

```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/compile_min_install.sh | bash
```
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/compile_min_install_amd64v3.sh | bash
```

### 升级

最小化编译升级:
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/compile_min_reinstall.sh | bash
```
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/compile_min_reinstall_amd64v3.sh | bash
```

### Windows客户端

文件位于`/root/go/bin/windows_amd64`

```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/win64clientmake_amd64v3.sh | bash
```
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/win64clientmake_nobeta_amd64v3.sh | bash
```
支持手动指定版本:
```
%VERSION%可指定为 v1.8.2 或者 latest (最新正式版)或者 v1.9.0-alpha.6 类似的格式
%TAGS%可指定为 with_quic,with_dhcp,with_ech,with_utls,with_reality_server 类似的格式,或直接为空
```
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/win64clientmake_specifyversion_amd64v3.sh | bash -s -- --version %VERSION% --tags %TAGS%
```

### 卸载

```
curl -sSL https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/sh/uninstall.sh | bash
```
