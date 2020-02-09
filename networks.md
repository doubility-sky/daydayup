A [computer network](https://en.wikipedia.org/wiki/Computer_network) is a digital telecommunications network for sharing resources between nodes, which are computing devices that use a common telecommunications technology. Data transmission between nodes is supported over data links consisting of physical cable media, such as twisted pair or fiber-optic cables, or by wireless methods, such as Wi-Fi, microwave transmission, or free-space optical communication.



- [Awesome Networking](https://github.com/clowwindy/Awesome-Networking), A curated list of awesome networking libraries, resources and shiny things.
- [[proxy]]
- [[security]]



## Learn
- [Computer Networks: A Systems Approach](https://github.com/ruanyf/book-computer-networks) A free ebook. Built upon the source from [SystemsApproach/book](https://github.com/SystemsApproach/book). Read online https://book.systemsapproach.org



## TCP/IP
- [TCP/IP Illustrated](https://www.google.com/search?q=TCP%2FIP+Illustrated&ie=utf-8&oe=utf-8&aq=t&gws_rd=ssl)
- [tcpdump](http://www.tcpdump.org/tcpdump_man.html)
- [Beej's Guide to Network Programming](http://beej.us/guide/bgnet/output/html/multipage/index.html)
- [The C10K problem](http://www.kegel.com/c10k.html)
- [Tornado - ioloop.py](https://github.com/tornadoweb/tornado/blob/master/tornado/ioloop.py)
- [Linux source](https://github.com/torvalds/linux/tree/master/net/ipv4)
- [XNU source](http://www.opensource.apple.com/source/xnu/xnu-3248.20.55/bsd/netinet/)
- [TCP Hybla](http://www.mathcs.emory.edu/~cheung/Courses/558/Syllabus/Papers/TCP-Hybla.pdf)
- [TCP 的那些事儿（上）](https://coolshell.cn/articles/11564.html), [TCP 的那些事儿（下）](https://coolshell.cn/articles/11609.html)
- [TIME_WAIT and its design implications for protocols and scalable client server systems](http://www.serverframework.com/asynchronousevents/2011/01/time-wait-and-its-design-implications-for-protocols-and-scalable-servers.html)
- [TCP TIME-WAIT state on busy Linux servers](https://vincent.bernat.ch/en/blog/2014-tcp-time-wait-state-linux)



## HTTP
- [HTTP: The Definitive Guide](http://shop.oreilly.com/product/9781565925090.do)
- [HTTP/1.1](https://www.ietf.org/rfc/rfc2616.txt)
- [HTTP/2 draft](https://tools.ietf.org/html/draft-ietf-httpbis-http2-16)
- [High Performance Browser Networking](http://chimera.labs.oreilly.com/books/1230000000545)
- [HTTP/2 explained](https://github.com/bagder/http2-explained)
- [HTTP/3 explained](https://github.com/bagder/http3-explained)
- [我的HTTP/3学习笔记](https://mp.weixin.qq.com/s/bD8C0oR34ZKUEZjN9yBSJg)
- [一文读懂HTTP/2 及 HTTP/3特性](https://github.com/ljianshu/Blog/issues/57)
- [HTTP的前世今生](https://coolshell.cn/articles/19840.html)
- [tinyhttpd](https://github.com/qinhanlei/tinyhttpd)
- [HTTPie](https://github.com/jakubroztocil/httpie) (pronounced aitch-tee-tee-pie) is a command line HTTP client. Its goal is to make CLI interaction with web services as human-friendly as possible. It provides a simple http command that allows for sending arbitrary HTTP requests using a simple and natural syntax, and displays colorized output. HTTPie can be used for testing, debugging, and generally interacting with HTTP servers.
- [whistle](https://github.com/avwo/whistle) HTTP, HTTP2, HTTPS, Websocket debugging proxy https://wproxy.org/



## Socket
- [luasocket](https://github.com/diegonehab/luasocket)
- [socket.io](https://github.com/socketio/socket.io)
#### [WebSocket](https://en.wikipedia.org/wiki/WebSocket)
- [RFC 6455 - The WebSocket Protocol](https://tools.ietf.org/html/rfc6455)
- [WebSocket协议：5分钟从入门到精通](https://www.cnblogs.com/chyingp/p/websocket-deep-in.html)
- [WebSocket 协议深入探究](https://www.infoq.cn/article/deep-in-websocket-protocol)
- [Gorilla WebSocket](https://github.com/gorilla/websocket) is a Go implementation of the WebSocket protocol.



## KCP
- [KCP - A Fast and Reliable ARQ Protocol](https://github.com/skywind3000/kcp)
- [kcp-go](https://github.com/xtaci/kcp-go)
- [可靠 UDP，KCP 协议快在哪？](https://testerhome.com/topics/14688)
#### kcptun
- [kcptun](https://github.com/xtaci/kcptun)



## [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call)
#### [gRPC](https://www.grpc.io/)
gRPC is a modern open source high performance RPC framework that can run in any environment. It can efficiently connect services in and across data centers with pluggable support for load balancing, tracing, health checking and authentication. It is also applicable in last mile of distributed computing to connect devices, mobile applications and browsers to backend services.
- https://github.com/grpc-ecosystem
- https://github.com/grpc-ecosystem/awesome-grpc



## DNS
- [DNS](https://www.ietf.org/rfc/rfc1035.txt)



## Protocols and APIs
- [tuntap](https://www.kernel.org/doc/Documentation/networking/tuntap.txt)
- [NAT](https://www.ietf.org/rfc/rfc1631.txt)
- [Android VpnService](http://developer.android.com/reference/android/net/VpnService.html)
- [Network Extension](https://developer.apple.com/library/prerelease/ios/documentation/NetworkExtension/Reference/Network_Extension_Framework_Reference/index.html#//apple_ref/doc/uid/TP40016234)



## Tools
- [mtr](https://github.com/traviscross/mtr) combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool.
- [iperf3](https://github.com/esnet/iperf) : A TCP, UDP, and SCTP network bandwidth measurement tool
- [curl](https://github.com/curl/curl) A command line tool and library for transferring data with URL syntax, supporting HTTP, HTTPS, FTP, FTPS, GOPHER, TFTP, SCP, SFTP, SMB, TELNET, DICT, LDAP, LDAPS, FILE, IMAP, SMTP, POP3, RTSP and RTMP. libcurl offers a myriad of powerful features https://curl.haxx.se/
  - [POST examples](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58)
- [clumsy](https://github.com/jagt/clumsy) makes your network condition on Windows significantly worse, but in a controlled and interactive manner. http://jagt.github.io/clumsy/
- [comcast](https://github.com/tylertreat/comcast) Simulating shitty network connections so you can build better systems.
- [Netdata](https://github.com/netdata/netdata) is distributed, real-time, performance and health monitoring for systems and applications. It is a highly-optimized monitoring agent you install on all your systems and containers.

### Analyzer
- [Wireshark](https://github.com/wireshark/wireshark) Wireshark is a network traffic analyzer, or "sniffer", for Linux, macOS, *BSD and other Unix and Unix-like operating systems and for Windows. It uses Qt, a graphical user interface library, and libpcap and npcap as packet capture and filtering libraries. https://www.wireshark.org/

### Download
- [aria2](https://github.com/aria2/aria2) is a lightweight multi-protocol & multi-source, cross platform download utility operated in command-line. It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink. https://aria2.github.io/
  - [webui-aria2](https://github.com/ziahamza/webui-aria2) The aim for this project is to create the worlds best and hottest interface to interact with aria2. Very simple to use, just download and open index.html in any web browser.

