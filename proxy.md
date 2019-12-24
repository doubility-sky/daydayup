- for running world-wide productions
- fast your [[game-client]] communicate with [[game-server]], or other softwares



## Symbol annotation
- `-cli` short for `client side program`
- `-svr` short for `server side program`
- `-SVR` short for `Server`
- `<->` is short for `lcoal connection`
- `<···>` is short for `remote connection`



## [SOCKS](https://en.wikipedia.org/wiki/SOCKS)
[SOCKS Protocol Version 5](https://www.ietf.org/rfc/rfc1928.txt)
- SOCKS is an Internet protocol that exchanges network packets between a client and server through a proxy server. 
- SOCKS5 additionally provides authentication so only authorized users may access a server. 
- Practically, a SOCKS server proxies TCP connections to an arbitrary IP address, and provides a means for UDP packets to be forwarded.  
- SOCKS performs at Layer 5 of the OSI model (the session layer, an intermediate layer between the presentation layer and the transport layer). 
- SOCKS server accepts incoming client connection on TCP port 1080.
#### [shadowsocks](http://shadowsocks.org/en/index.html)
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
#### Solution
```
user-device <-> SS-cli <···> SS-svr <···> target
             |<--    doing proxy   -->|
```
- run `SS-cli` on `user-device`
- run `SS-svr` on `PROXY-SVR`




## [kcptun](https://github.com/xtaci/kcptun)
- A Stable & Secure Tunnel based on KCP with N:M multiplexing and FEC. Available for ARM, MIPS, 386 and AMD64
#### Solution
```
     user-device                      PROXY-SVR
  /               \                 /           \
<-> SS-cli <-> kcptun-cli <···> kcptun-svr <-> SS-svr <···> target
 |<--------             doing proxy            -------->|
```
- `SS` short for `shadowsocks` 
- run `SS-svr`, `kcptun-svr` on `PROXY-SVR`
- run `SS-cli`, `kcptun-cli` on `user-device`
- `kcptun-cli` may running on another `intermediate server`




## [udp2raw](https://github.com/wangyu-/udp2raw-tunnel)
A Tunnel which turns UDP Traffic into Encrypted FakeTCP/UDP/ICMP Traffic by using Raw Socket, helps you Bypass UDP FireWalls(or Unstable UDP Environment). It can defend Replay-Attack and supports Multiplexing. It also acts as a Connection Stabilizer.
- [udp2raw-multiplatform](https://github.com/wangyu-/udp2raw-multiplatform) for macOS
#### Solution
```
        user-device                         PROXY-SVR   
   /                    \               /               \
<-> SS=kcptun-cli <-> u2r-cli <···> u2r-svr <-> kcptun=SS-svr <···> target
 |<------------             doing proxy            ------------>|
```
- `SS=kcptun-cli` short for `SS-cli <-> kcptun-cli`
- `kcptun=SS-svr` short for `kcptun-svr <-> SS-svr`
- run `udp2raw-svr`, `kcptun-svr`, `SS-svr` on `PROXY-SVR`
- run `SS-cli`, `kcptun-cli`, `udp2raw-cli` on `user-device`
- `kcptun-cli`, `udp2raw-cli` may running on another `intermediate server`



## VPN
- [一键安装vpn服务器](https://github.com/hwdsl2/setup-ipsec-vpn)
- [DSVPN](https://github.com/jedisct1/dsvpn) is a Dead Simple VPN, designed to address the most common use case for using a VPN

