# Domino for Linux on Proxmox

[Proxmox](https://www.proxmox.com) is a modern and very flexible virtualization environment that supports both full virtual machines and lightweight Linux containers.

Domino can be deployed as a standard VM using the usual best practices.
However, Proxmox also offers a second option that can be interesting for more flexible or resource-efficient deployments: **LXC containers**.
LXC uses the Proxmox host kernel directly and provides a thin virtualization layer with very low overhead.

## Benefits of LXC on Proxmox

* **Very fast, template-based provisioning**
  LXC containers start quickly and can be cloned from templates in seconds.

* **ZFS subvolumes instead of ZVOLs**
  This allows more flexible and space-efficient storage management, including snapshots, replication, and compression.

* **Lower overhead than traditional VMs**
  Ideal when running many smaller Domino servers for testing, clustering, or multi-tenant environments.

## Special Considerations for LXC

[LXC containers](https://linuxcontainers.org/) are not full VMs and impose certain capability and security restrictions by default.
One practical issue is that the **Domino WebKit tar files include very high user and group IDs**, which causes extraction to fail inside LXC due to the UID/GID mapping restrictions.

By default, `tar` tries to restore the original owner. In an unprivileged LXC container, this is blocked.

### Workaround

Before running the InstallAnywhere installer, export the following environment variable so tar does **not** attempt to restore ownership:

```bash
export TAR_OPTIONS=--no-same-owner
```

This ensures the WebKit tar files extract cleanly inside the container.
