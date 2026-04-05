---
layout: default
title: Connecting via SSH
nav_order: 2
parent: Installation & Setup
---

# Connecting to a Linux System via SSH

## Introduction

SSH (Secure Shell) is the standard protocol used to securely access remote Linux systems. It provides:

- Encrypted communication over the network
- Command-line access to remote systems
- Secure file transfer capabilities

Instead of passwords, many systems use **SSH keys** for authentication. A key pair consists of:

- A **private key** (kept on your machine, must be protected)
- A **public key** (stored on the server)

When you connect, SSH verifies that your private key matches the public key on the server.


# Basic SSH Connection

The standard command is:

```bash
ssh -i <path-to-private-key> <user>@<hostname>
```

Example:

```bash
ssh -i mykey.pem root@myhost.domino-lab.net
```

Notes:

- `<user>` is the remote user (e.g. `root`, `ubuntu`, `admin`)
- `<hostname>` is the server name or IP address
- The `-i` option specifies your private key


# macOS and Linux (Recommended Starting Point)

Both systems include a built-in SSH client.

## Set Key Permissions

SSH requires that your private key is only accessible by you:

```bash
chmod 600 mykey.pem
```

If permissions are too open, SSH will refuse to use the key.


## Connect

```bash
ssh -i mykey.pem user@hostname
```


# Windows with MobaXterm (Recommended Option)

MobaXterm provides an easy graphical interface.

There is a [MobaXterm Home edition](https://mobaxterm.mobatek.net/download-home-edition.html) which provides a portable edition, which does not need installation.
It just needs to be extracted and started.

Steps:

1. Start MobaXterm
2. Click "Session" → "SSH"
3. Enter your hostname
4. Specify the remote user
5. Enable "Use private key" and select your key file
6. Connect

MobaXterm uses the standard OpenSSH key file PEM based format.


# Windows with OpenSSH (Command Line)

Modern Windows versions include OpenSSH:

```bash
ssh -i mykey.pem user@hostname
```

## Set Key Permissions (Important)


```
icacls ed25519 /inheritance:d
icacls ed25519 /remove "Authenticated Users" "Users" "Everyone"
icacls ed25519 /grant:r "%USERNAME%":R

```

This ensures only your user can read the key.



# Windows with PuTTY / WinSCP (Advanced)

## PuTTY

PuTTY requires its own key format (`.ppk`).

### Convert Key

Use PuTTYgen to convert your key:

- Load your `.pem` file
- Save as `.ppk`

### Configure Connection

1. Open PuTTY
2. Enter hostname
3. Go to **Connection → SSH → Auth**
4. Select your `.ppk` file
5. Connect


## WinSCP

WinSCP is used for file transfers.

Steps:

1. Enter hostname and username
2. Select your private key file
3. Connect using SCP or SFTP


# Common Issues

## Wrong Username

Always specify the remote user:

```bash
ssh user@hostname
```


## Key Rejected

Check:

- Correct key file is used
- Permissions are restricted
- Public key is installed on the server


## Permission Warning

If you see:

```
WARNING: UNPROTECTED PRIVATE KEY FILE!
```

Fix permissions as described above.


# Summary

Typical command:

```bash
ssh -i mykey.pem user@hostname
```

Key points:

- SSH provides secure remote access
- Use key-based authentication when possible
- Ensure private key permissions are properly restricted
