## WSL 2 Windows Subsystem for Linux

WSL 2 is a real Linux system running inside Windows, using a real Linux kernel, delivered through a highly optimized, invisible virtual machine.

**WSL 2 = Linux kernel + lightweight VM + deep Windows integration**

- It is **not** a compatibility layer  
- It is **not** emulation  
- It **is virtualization** — just done so tightly that most users don’t notice  

The whole stack is engineered by Microsoft specifically for developer workloads.

WSL 2 is your perfect companion on every Windows machine.  
It can be the base for developing software, running local applications, and is also the foundation for Docker Desktop.  
WSL 2 can also run a Docker server locally.


## Install WSL 2

WSL 2 is integrated with Windows and is simple to install:

```bash
wsl --install
wsl --install -d Ubuntu-24.04
````


## What Actually Runs When You Start WSL 2

When you launch a WSL 2 distro:

- Windows starts a very small Hyper-V–based VM
- That VM boots a Microsoft-maintained Linux kernel
- Your Linux distro runs unchanged userland binaries
- Windows and Linux communicate through optimized channels (not emulation)

You are literally executing Linux system calls on a Linux kernel maintained by Microsoft.

The WSL instance runs a Linux distribution on the Microsoft kernel.
You can even run multiple distributions.

Docker Desktop for Windows also leverages WSL 2 as the back-end subsystem for running the container runtime.


## Why WSL Is Not Like a Traditional VM

| Traditional VM      | WSL 2                 |
| ------------------- | --------------------- |
| Manual VM creation  | Automatic, invisible  |
| Fixed RAM/CPU       | Dynamic, demand-based |
| Separate networking | Integrated networking |
| Separate filesystem | Seamless file access  |
| Heavy management    | Zero-touch            |


## Filesystem – Two Filesystems (One Common Mistake)


### Linux filesystem

- EXT4 inside a virtual disk
- Paths: `/home`, `/var`, `/etc`
- Fast for Linux tools


### Windows filesystem

- NTFS
- Mounted under: `/mnt/c`, `/mnt/d`, …


**Special notes:**

- Linux tools should operate on Linux filesystems, not `/mnt/c`
- Doing builds or heavy I/O on `/mnt/c` is the #1 performance killer in WSL 2


## Networking: Simple on the Surface, Subtle Underneath

- Linux gets its own virtual network interface
- NAT’d behind Windows
- Outbound traffic behaves like native Linux
- Inbound ports are automatically forwarded to `localhost`

That’s why:

- `curl localhost` works
- Docker ports map cleanly
- You usually don’t care about IP addresses


## systemd Support in Modern WSL 2

- Real background services
- Docker works naturally
- Timers, journald, services — all real


## In Short

- **Windows** is the host OS
- **Linux** is a first-class guest OS, embedded, automated, and optimized for developers
