---
title: Red Hat vs Ubuntu for Domino
nav_order: 11
parent: Home
---

# Ubuntu Differences (Domino-Focused)





\## Introduction



This document describes the \*\*differences when installing and running HCL Domino on Ubuntu Linux\*\*.





\## Update Linux



```

apt update

apt upgrade -y

reboot

```



Equivalent to:



```

dnf -y update

```




\## Install Required Domino Packages



```

apt install -y gdb perl tar unzip 

```





\## Extra Repositories



On Redhat/CentOS based systems some useful tools are not included in the standard repositories.

You have to install the extra EPEL packages.



```

dnf install epel-release

```



On Ubuntu most packages are in the standard repository.

There are still some specific packages which are part of the universe repository, which might not be configured by default.





\# Additional Tools (Optional but Recommended)



```apt install -y jq git ncdu net-tools dnsutils sysstat

```





\# Firewall Configuration (Domino Ports)



Ubuntu uses \*\*UFW instead of firewalld\*\*



\## Enable required Domino ports



```

ufw allow 1352/tcp   # NRPC

ufw allow 80/tcp     # HTTP

ufw allow 443/tcp    # HTTPS

ufw allow 25/tcp     # SMTP



ufw enable

```



\# Summary



| Area            | RHEL-based    | Ubuntu       |

| --------------- | ------------- | ------------ |

| Package manager | yum / dnf     | apt          |

| Extra repo      | EPEL required | not required |

| Firewall        | firewalld     | UFW          |





