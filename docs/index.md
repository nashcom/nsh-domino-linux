---
layout: default
title: Home
nav_order: 1
has_children: true
---

# Domino on Linux — Community Guide

**Don't panic — just deploy.**

Domino on Linux can be simple, powerful, and extremely stable — if you combine the right OS practices, platform components, automation workflows, container strategies, and integration patterns.

This is a **community-maintained guide** that complements [HCL's official Domino Linux documentation](https://opensource.hcltechsw.com/domino-linux/). It documents practical, proven approaches based on many years of real-world deployment, troubleshooting, automation and operations experience.

## What You'll Find Here

- **Getting Started**: Understanding how to run Domino on Linux (VM, Docker, Kubernetes)
- **Choose Your Distribution**: Red Hat vs Ubuntu, and what matters
- **Installation Guide**: Step-by-step approach to deploying Domino
- **Infrastructure**: Naming services, SSH, storage (ZFS), networking
- **Container Strategy**: Benefits and patterns for containerized Domino
- **Tools & Projects**: Related repositories and integrations

## Quick Navigation

- [How to Run Domino on Linux](docs/domino-linux.md) — Start here for deployment options
- [Choose a Linux Distribution](docs/linux-distribution.md) — Red Hat vs Ubuntu comparison
- [Installation Guide](docs/howto_install_domino.md) — Step-by-step setup
- [Container Benefits](docs/container_benefits.md) — Why containers matter
- [Tools & Related Projects](docs/git-projects.md) — Ecosystem and integrations

## Philosophy

Rather than duplicating existing documentation, this project references and integrates related tools and solutions. Where separate projects exist, this guide points to them. Where configuration and orchestration require end-to-end examples, this project provides opinionated, practical scenarios.

## Getting Started

1. [Understand your deployment options](docs/domino-linux.md)
2. [Choose your Linux distribution](docs/linux-distribution.md)
3. [Follow the installation guide](docs/howto_install_domino.md)
4. [Explore advanced topics](docs/) as needed

---

**Based on 30+ years of Domino expertise and real-world operations experience.**

## Related Resources

- [HCL's Official Domino Linux Project](https://opensource.hcltechsw.com/domino-linux/) — Official documentation and reference
- [HCL Domino Container Project](https://github.com/nash-protocol/hcl-domino-container) — Container images and orchestration
- [Service Guard](https://github.com/nash-protocol/srvguard) — Vault-integrated secret launcher for Domino
