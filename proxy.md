

- [[networks]]
- for running world-wide productions
- fast your [[game-client]] communicate with [[game-server]], or other softwares
- [haoel.github.io](https://github.com/haoel/haoel.github.io) open internet right way.



## [VPN](https://en.wikipedia.org/wiki/Virtual_private_network)
- [IPsec VPN Server Auto Setup Scripts](https://github.com/hwdsl2/setup-ipsec-vpn) Set up your own IPsec VPN server in just a few minutes, with both IPsec/L2TP and Cisco IPsec on Ubuntu, Debian and CentOS. All you need to do is provide your own VPN credentials, and let the scripts handle the rest.
- [DSVPN](https://github.com/jedisct1/dsvpn) is a Dead Simple VPN, designed to address the most common use case for using a VPN
- [n2n](https://github.com/ntop/n2n) is a light VPN software which makes it easy to create virtual networks bypassing intermediate firewalls.
- L2PT VPN connection on Windows10 must set in `regedit`: Create an option DWORD(32bits) `AssumeUDPEncapsulationContextOnSendRule` and value `2` in `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent`

### [WireGuard](https://www.wireguard.com/)
- [Mirror](https://github.com/WireGuard) of various WireGuard-related projects. See https://www.wireguard.com/repositories/ for official repositories.
- [Getting Started with WireGuard](https://miguelmota.com/blog/getting-started-with-wireguard/)
- [Wireguard：简约之美](https://zhuanlan.zhihu.com/p/91383212)
- [Noise 框架：构建安全协议的蓝图](https://zhuanlan.zhihu.com/p/96944134)



## Symbol annotation
- `-SVR` short for `Server`
- `-cli` short for `client side program`
- `-svr` short for `server side program`
- `--` is short for `lcoal connection`
- `···` is short for `remote connection`



## [SOCKS](https://en.wikipedia.org/wiki/SOCKS)
[SOCKS Protocol Version 5](https://www.ietf.org/rfc/rfc1928.txt)
- SOCKS is an Internet protocol that exchanges network packets between a client and server through a proxy server. 
- SOCKS5 additionally provides authentication so only authorized users may access a server. 
- Practically, a SOCKS server proxies TCP connections to an arbitrary IP address, and provides a means for UDP packets to be forwarded.  
- SOCKS performs at Layer 5 of the OSI model (the session layer, an intermediate layer between the presentation layer and the transport layer). 
- SOCKS server accepts incoming client connection on TCP port 1080.

### [shadowsocks](http://shadowsocks.org/en/index.html)
- [Shadowsocks 笔记](https://github.com/JadaGates/ShadowsocksBio)
- A fast tunnel proxy that helps you bypass firewalls.  
- Features:  
  - TCP & UDP support  
  - User management API  
  - TCP Fast Open  
  - Workers and graceful restart  
  - Destination IP blacklist  
- [whitepaper](http://shadowsocks.org/assets/whitepaper.pdf), [github-repo](https://github.com/shadowsocks/shadowsocks/tree/master)
- [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev) is a lightweight secured SOCKS5 proxy for embedded devices and low-end boxes.  
  Shadowsocks-libev is written in pure C and depends on libev. It's designed to be a lightweight implementation of shadowsocks protocol, in order to keep the resource usage as low as possible.
- [Redirect attack on Shadowsocks stream ciphers](https://github.com/edwardz246003/shadowsocks)  
  - Do not use : shadowsocks-py, shadowsocoks-go, shadowsocoks-nodejs.  
  - Only Use: shadowsocks-libev, go-shadowsocks2 and only use the AEAD ciphers  

### solution
```
   user-device          PROXY-SVR
          \             /
        SS-cli ··· SS-svr ··· target
```
- `SS` short for `shadowsocks`



## [kcptun](https://github.com/xtaci/kcptun)
- A Stable & Secure Tunnel based on KCP with N:M multiplexing and FEC. Available for ARM, MIPS, 386 and AMD64

### solution
```
      user-device               PROXY-SVR
     /           \            /           \
 SS-cli -- kcptun-cli ··· kcptun-svr -- SS-svr ··· target
```
- `kcptun-cli` may running on another `intermediate server`



## [udp2raw](https://github.com/wangyu-/udp2raw-tunnel)
A Tunnel which turns UDP Traffic into Encrypted FakeTCP/UDP/ICMP Traffic by using Raw Socket, helps you Bypass UDP FireWalls(or Unstable UDP Environment). It can defend Replay-Attack and supports Multiplexing. It also acts as a Connection Stabilizer.
- [udp2raw-multiplatform](https://github.com/wangyu-/udp2raw-multiplatform) for macOS

### solution
```
          user-device                                  PROXY-SVR
      /                 \                         /                  \
 SS-cli -- kcptun-cli -- udp2raw-cli ··· udp2raw-svr -- kcptun-svr -- SS-svr ··· target
```
- `kcptun-cli`, `udp2raw-cli` may running on another `intermediate server`



## [v2ray](https://github.com/v2ray) 
A platform for building proxies to bypass network restrictions. https://www.v2ray.com/
- [V2Fly](https://github.com/v2fly), a community-driven edition of V2Ray.
- [V2Ray 配置指南](https://toutyrater.github.io/)
- [V2RayX](https://github.com/Cenmrev/V2RayX) GUI for v2ray-core on macOS
- [Qv2ray](https://github.com/Qv2ray/Qv2ray) - Make v2ray real cross-platform



## [torjan](https://github.com/trojan-gfw/trojan)
- [trojan-go](https://github.com/p4gefau1t/trojan-go): A Trojan proxy written in Go. An unidentifiable mechanism that helps you bypass GFW.



## [gost](https://github.com/ginuerzh/gost)
GO Simple Tunnel - a simple tunnel written in golang 



## [[OpenWrt]]
- [路由器 + OpenWrt + SS](https://github.com/softwaredownload/openwrt-fanqiang) https://fanqiang.software-download.name



## Tools
- [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega) Chromium Extension: Manage and switch between multiple proxies quickly & easily.
- [Charles](https://www.charlesproxy.com/) is an HTTP proxy / HTTP monitor / Reverse Proxy that enables a developer to view all of the HTTP and SSL / HTTPS traffic between their machine and the Internet. This includes requests, responses and the HTTP headers (which contain the cookies and caching information).
- [proxychains](https://github.com/haad/proxychains) - a tool that forces any TCP connection made by any given application to follow through proxy like TOR or any other SOCKS4, SOCKS5 or HTTP(S) proxy. Supported auth-types: "user/pass" for SOCKS4/5, "basic" for HTTP.
  - [proxychains ng](https://github.com/rofl0r/proxychains-ng) (new generation) - a preloader which hooks calls to sockets in dynamically linked programs and redirects it through one or more socks/http proxies. continuation of the unmaintained proxychains project. the sf.net page is currently not updated, use releases from github release page instead.
- [Proxifier](https://www.proxifier.com/) allows network applications that do not support working through proxy servers to operate through a SOCKS or HTTPS proxy and chains.
  - NOTE: Resolve hostnames through proxy
- [Surge](https://nssurge.com/): Advanced Network Toolbox for Mac & iOS

### [Outline](https://getoutline.org/)
Outline is an open source project created by Jigsaw to provide a safer way for news organizations and journalists to access the internet.
- [Outline Client](https://github.com/Jigsaw-Code/outline-client) is a cross-platform VPN or proxy client for Windows, macOS, iOS, Android, and ChromeOS. The Outline Client is designed for use with the Outline Server software, but it is fully compatible with any Shadowsocks server.
- [Outline Server](https://github.com/Jigsaw-Code/outline-server) Outline Manager, developed by Jigsaw. The Outline Manager application creates and manages Outline servers, powered by Shadowsocks. It uses the Electron framework to offer support for Windows, macOS and Linux. https://getoutline.org/

### Ruls
- [g.f.w - list](https://github.com/gfwlist/gfwlist)
- [Daily](https://github.com/pexcn/daily): Poetry and far afield. 🌊
- [shadowrocket rules](https://github.com/h2y/Shadowrocket-ADBlock-Rules)
- [surge-rules](https://github.com/Loyalsoldier/surge-rules): 本项目生成适用于 Surge 的规则集（DOMAIN-SET 和 RULE-SET）



## FAQs
- method aes-256-gcm not supported
  - `pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U`
  - `sudo apt-get install -y libsodium*`
- ['Cannot open BPF device' error on c.open()](https://github.com/mscdex/cap/issues/47)
  - `sudo chmod o+r /dev/bpf*` should help in reading of Berkley Packet Filter.
  - `sudo chmod o+r+w /dev/bpf*` for udp2raw on macOS
