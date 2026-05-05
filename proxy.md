
- [[networks]]
- for running world-wide productions
- fast your [[game-client]] communicate with [[game-server]], or other softwares
- [haoel.github.io](https://github.com/haoel/haoel.github.io) open internet right way.


## [VPN](https://en.wikipedia.org/wiki/Virtual_private_network)
- [IPsec VPN Server Auto Setup Scripts](https://github.com/hwdsl2/setup-ipsec-vpn) Set up your own IPsec VPN server in just a few minutes, with both IPsec/L2TP and Cisco IPsec on Ubuntu, Debian and CentOS. All you need to do is provide your own VPN credentials, and let the scripts handle the rest.
- [DSVPN](https://github.com/jedisct1/dsvpn) is a Dead Simple VPN, designed to address the most common use case for using a VPN
- [n2n](https://github.com/ntop/n2n) is a light VPN software which makes it easy to create virtual networks bypassing intermediate firewalls.
- L2PT VPN connection on Windows10 must set in `regedit`: Create an option DWORD(32bits) `AssumeUDPEncapsulationContextOnSendRule` and value `2` in `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent`
- [Android VpnService](http://developer.android.com/reference/android/net/VpnService.html)
- [iOS - Network Extension](https://developer.apple.com/library/prerelease/ios/documentation/NetworkExtension/Reference/Network_Extension_Framework_Reference/index.html#//apple_ref/doc/uid/TP40016234)

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
- FAQs
  - method aes-256-gcm not supported
    - `pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U`
    - `sudo apt-get install -y libsodium*`

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
- FAQs 
  - ['Cannot open BPF device' error on c.open()](https://github.com/mscdex/cap/issues/47)
    - `sudo chmod o+r /dev/bpf*` should help in reading of Berkley Packet Filter.
    - `sudo chmod o+r+w /dev/bpf*` for udp2raw on macOS
- NOTE (2026): the `faketcp` mode is increasingly fingerprintable by GFW deep-packet-inspection — its handshake never completes a real TCP state machine, and bursty UDP-over-fake-TCP shows up as an obvious anomaly. Pair it with `shadow-tls` (below) as a real-TLS fallback.

### solution
```
          user-device                                  PROXY-SVR
      /                 \                         /                  \
 SS-cli -- kcptun-cli -- udp2raw-cli ··· udp2raw-svr -- kcptun-svr -- SS-svr ··· target
```
- `kcptun-cli`, `udp2raw-cli` may running on another `intermediate server`


## [shadow-tls](https://github.com/ihciah/shadow-tls)
A proxy that wraps Shadowsocks (or any TCP stream) inside a **real** TLS 1.3 handshake with a chosen camouflage site, so on-wire traffic is indistinguishable from genuine HTTPS to that SNI. Designed as the modern successor to `simple-obfs` / `v2ray-plugin tls`, both of which are now reliably detected by GFW.
- v3 protocol adds `--strict` server mode + per-session password binding, defeating the active-probing attacks that broke v1/v2.
- Single static-musl binary (Rust); runs alongside the existing `ss-server`, no library deps.
- Pick an SNI that 1) is not behind Cloudflare/Fastly (the IP must plausibly belong to that CDN edge), 2) supports TLS 1.3, 3) is not blocked. Apple / Microsoft / cloud-storage hostnames work well; e.g. `gateway.icloud.com:443`, `mp.weixin.qq.com:443` are popular.
- Both endpoints must agree on `--password`; the *client* `--sni` must equal the *server* `--tls` host.
- End-device options:
  1. **Native shadow-tls plugin** on the device — Surge / Shadowrocket / sing-box / Clash.Meta all support it directly.
  2. **Domestic relay** — run a `shadow-tls client` on a CN jump host or LAN gateway; downstream devices then see only a plain SS endpoint, no plugin needed.

### solution
```
            user-device                                              PROXY-SVR
        /                  \                                     /                  \
   SS-cli  ──  shadow-tls-cli  ·····TLS 1.3 to chosen SNI·····  shadow-tls-svr  ──  SS-svr  ··· target
```
or with an in-CN relay (devices stay on plain SS):
```
   device --SS-- jumpHost(shadow-tls-cli) ···TLS··· VPS(shadow-tls-svr) -- SS-svr ··· target
```
- Combine with the `kcptun + udp2raw` chain by listening on different public ports on the same VPS (e.g. UDP `7043` for kcp, fake-TCP `8053` for udp2raw, real-TLS `443` for shadow-tls). Different links degrade independently under GFW pressure.


## [v2ray](https://github.com/v2ray) 
A platform for building proxies to bypass network restrictions. https://www.v2ray.com/
- [V2Fly](https://github.com/v2fly), a community-driven edition of V2Ray.
- [V2Ray 配置指南](https://toutyrater.github.io/)
- [V2RayX](https://github.com/Cenmrev/V2RayX) GUI for v2ray-core on macOS
- [Qv2ray](https://github.com/Qv2ray/Qv2ray) - Make v2ray real cross-platform


## [trojan](https://github.com/trojan-gfw/trojan)
- [trojan-go](https://github.com/p4gefau1t/trojan-go): A Trojan proxy written in Go. An unidentifiable mechanism that helps you bypass GFW.
- Architecturally similar to shadow-tls (real TLS to a fronting hostname), but couples the proxy protocol to its own TLS termination. shadow-tls keeps Shadowsocks as the inner protocol, so existing SS infrastructure / clients / rules can be reused unchanged.


## [VLESS + Reality](https://github.com/XTLS/Xray-core)
- The XTLS Reality transport: like shadow-tls, it borrows the certificate / handshake of a real public site to camouflage traffic, but runs natively inside Xray (no external TLS termination). Currently the strongest single-protocol option against active probing.
- Choose between the two by ecosystem: Reality if you're already on the v2ray/Xray stack; shadow-tls if you want to keep a Shadowsocks core.


## [[OpenWrt]]
- [路由器 + OpenWrt + SS](https://github.com/softwaredownload/openwrt-fanqiang) https://fanqiang.software-download.name


## Tools
- [Charles](https://www.charlesproxy.com/) is an HTTP proxy / HTTP monitor / Reverse Proxy that enables a developer to view all of the HTTP and SSL / HTTPS traffic between their machine and the Internet. This includes requests, responses and the HTTP headers (which contain the cookies and caching information).
- [proxychains](https://github.com/haad/proxychains) - a tool that forces any TCP connection made by any given application to follow through proxy like TOR or any other SOCKS4, SOCKS5 or HTTP(S) proxy. Supported auth-types: "user/pass" for SOCKS4/5, "basic" for HTTP.
  - [proxychains ng](https://github.com/rofl0r/proxychains-ng) (new generation) - a preloader which hooks calls to sockets in dynamically linked programs and redirects it through one or more socks/http proxies. continuation of the unmaintained proxychains project. the sf.net page is currently not updated, use releases from github release page instead.
- [Proxifier](https://www.proxifier.com/) allows network applications that do not support working through proxy servers to operate through a SOCKS or HTTPS proxy and chains.
  - NOTE: Resolve hostnames through proxy
- [Surge](https://nssurge.com/): Advanced Network Toolbox for Mac & iOS

### Extensions
- [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega) Chromium Extension: Manage and switch between multiple proxies quickly & easily.
  - [ZeroOmega](https://github.com/zero-peak/ZeroOmega), forked from SwitchyOmega compatible with manifest v3

### [Outline](https://getoutline.org/)
Outline is an open source project created by Jigsaw to provide a safer way for news organizations and journalists to access the internet.
- [Outline Client](https://github.com/Jigsaw-Code/outline-client) is a cross-platform VPN or proxy client for Windows, macOS, iOS, Android, and ChromeOS. The Outline Client is designed for use with the Outline Server software, but it is fully compatible with any Shadowsocks server.
- [Outline Server](https://github.com/Jigsaw-Code/outline-server) Outline Manager, developed by Jigsaw. The Outline Manager application creates and manages Outline servers, powered by Shadowsocks. It uses the Electron framework to offer support for Windows, macOS and Linux. https://getoutline.org/

### Ruls
- [g.f.w - list](https://github.com/gfwlist/gfwlist)
- [Daily](https://github.com/pexcn/daily): Poetry and far afield. 🌊
- [shadowrocket rules](https://github.com/h2y/Shadowrocket-ADBlock-Rules)
- [surge-rules](https://github.com/Loyalsoldier/surge-rules): 本项目生成适用于 Surge 的规则集（DOMAIN-SET 和 RULE-SET）
