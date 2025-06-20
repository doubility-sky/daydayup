[Container (virtualization)](https://en.wikipedia.org/wiki/Container_(virtualization)), a server virtualization method.

In software engineering, containerization is operating-system-level virtualization or application-level virtualization over multiple network resources so that software applications can run in isolated user spaces called containers in any cloud or non-cloud environment, regardless of type or vendor.

- [[docker]]
- [[kubernetes]]



## Learn
- [The What, Why and How of Containers](https://www.annwan.me/computers/what-why-how-containers/)
  - Alternate title: An history of OS-Level Virtualisation on UNIX and then Linux.
  - This post is part of an entry for [the Handmade Network’s Learning Jam 2024](https://handmade.network/jam/learning-2024)



## Container
- [LXC](https://github.com/lxc/lxc) is the well-known and heavily tested low-level Linux container runtime. It is in active development since 2008 and has proven itself in critical production environments world-wide. Some of its core contributors are the same people that helped to implement various well-known containerization features inside the Linux kernel.
  - https://linuxcontainers.org/lxc/
  - [LXC 1.0](https://stgraber.org/2013/12/20/lxc-1-0-blog-post-series/) 10 blog posts covering what I think are some of the most exciting features of LXC
- [Podman](https://github.com/containers/podman) (the POD MANager) is a tool for managing containers and images, volumes mounted into those containers, and pods made from groups of containers.

### runtime
- [containerd](https://github.com/containerd/containerd) - An open and reliable container runtime.
- [CRI-O](https://github.com/cri-o/cri-o) - OCI-based implementation of Kubernetes Container Runtime Interface
- [gVisor](https://github.com/google/gvisor) provides a strong layer of isolation between running applications and the host operating system.
- [Kata Containers](https://github.com/kata-containers/kata-containers) is an open source project and community working to build a standard implementation of lightweight Virtual Machines (VMs) that feel and perform like containers, but provide the workload isolation and security advantages of VMs.
- [youki](https://github.com/youki-dev/youki) is an implementation of the OCI runtime-spec in Rust, similar to runc.
- [crun](https://github.com/containers/crun) - A fast and lightweight fully featured OCI runtime and C library for running containers



## Virtualization
- [QEMU](https://www.qemu.org/) A generic and open source machine emulator and virtualizer
- [Multipass](https://github.com/canonical/multipass) is a lightweight VM manager for Linux, Windows and macOS. It's designed for developers who want to spin up a fresh Ubuntu environment with a single command. It uses KVM on Linux, Hyper-V on Windows and QEMU on macOS to run virtual machines with minimal overhead. It can also use VirtualBox on Windows and macOS. Multipass will fetch Ubuntu images for you and keep them up to date.



## Orchestrator
- [[Kubernetes]] (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications.
- [Nomad](https://github.com/hashicorp/nomad) is an easy-to-use, flexible, and performant workload orchestrator that can deploy a mix of microservice, batch, containerized, and non-containerized applications. Nomad is easy to operate and scale and has native Consul and Vault integrations. https://www.nomadproject.io/



## Tools
- [Distrobox](https://github.com/89luca89/distrobox): Use any linux distribution inside your terminal. Enable both backward and forward compatibility with software and freedom to use whatever distribution you’re more comfortable with.
- [container](https://github.com/apple/container) is a tool that you can use to create and run Linux containers as lightweight virtual machines on your Mac. It's written in Swift, and optimized for Apple silicon.
