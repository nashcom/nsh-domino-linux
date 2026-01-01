# HCL Domino on Linux native Installation vs. Containerized Deployment


## 1. Native Domino on Linux – The Traditional Server Model

A **native Domino installation** means Domino is installed directly into a Linux operating system, running on:

- Bare metal
- A virtual machine

### Installation & Lifecycle

- Domino is installed via Domino web-kits
- The Linux OS is persistent and long-lived
- Domino startup is typically controlled by `systemd`
- Configuration changes are applied directly on the server on Linux level

### Operational Characteristics

- The server is treated as a **long-lived system**
- Hostname and network identity are stable
- Domino upgrades are performed **in place**
- Rollbacks usually require backups or snapshots

### Admin Experience

This is the **classic Domino mindset**:

- “This server exists”
- “We patch it carefully”
- “We don’t recreate it unless something breaks”

Native Domino aligns perfectly with **VM-centric and conservative infrastructures**.


## 2. Containerized Domino – Same Domino, Different Contract

A **containerized Domino deployment** runs the *same Domino binaries* inside a container runtime (Docker, Podman, Kubernetes, etc.).

The critical shift:

**You no longer install Domino on a server — you run Domino as an instance.**


### Installation & Startup

- Domino is pre-installed in a container image
- Starting Domino means starting a container
- There is no traditional OS boot or `systemd`
- The container runtime controls life-cycle


### Runtime Assumptions

- Containers are **ephemeral by design**
- The container itself is disposable
- Restarting or replacing the container is normal, not exceptional


### Upgrade & Rollback Model

- Upgrades = start a new container image
- No in-place patching
- Rollback = restart the previous image


### Admin Experience

The admin mindset changes to:

- “This server can be recreated”
- “Upgrades are reversible”
- “Consistency matters more than manual tuning”

Containerized Domino favors **automation, repeatability, and fast recovery**.


## What Does *Not* Change

Regardless of native or containerized deployment:

- Domino binaries are the same
- Domino configuration logic is the same
- Domino server identity rules still apply
- Domino clustering, replication, and security behave identically

Containers change **how Domino is operated**, not **what Domino is**.


## Summary for Domino Admins

| Aspect           | Native Linux   | Containerized    |
| ---------------- | -------------- | ---------------- |
| Install model    | In-place       | Image-based      |
| Server life-time | Long-lived     | Disposable       |
| Upgrade style    | Patch          | Replace          |
| Rollback         | Manual         | Trivial          |
| Admin mindset    | Server-centric | Instance-centric |


**Running Domino in containers is an operational choice, not a functional one.**
