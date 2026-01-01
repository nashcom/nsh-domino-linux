

# Standard Naming for Domino related services

This document defines standardized service names to standardize configuration.
Some of the services like name services, SMTP gateways might need multiple names, which are added to configuration.

The host name turns into the FQDN by adding the defined internet domain.
This schema can be also used for test, QA and development environments adding sub domains (example: smtp.dev.company.com).


## Protocol related Services

Well-known protocol specific names

| Service Name     | Description                                      |
|------------------|------------------------------------------------- |
| ldap             | Domino LDAP as the central directory over LDAPS  |
| auth             | Domino OIDC server                               |
| imap             | Domino IMAP                                      |
| pop3             | Domino POP3 if needed                            |
| mx               | External mail exchanger for inbound mail         |
| smtp             | Internal SMTP relay host                         |
| smtp-internal    | Internal SMTP mails only/no relay                |
| smtp-relay       | External SMTP Relay host in DMZ                  |


## Application Services

Applications which might be implemented using different type of technologies depending on the environment.
The following table lists the HCL family products, but could be complemented with other corporate applications like NextCloud.

| Service Name     | Description               |
|------------------|-------------------------- |
| webmail          | Verse                     |
| mobile           | Traveler                  |
| nomad            | Nomad                     |
| files            | WebDav                    |
| chat             | Sametime Chat             |
| meetings         | Sametime Meetings         |


## System Services

System replated services are usually not end user facing.
They are either used by servers or admins & developers.

| Service Name      | Description                               |
|-------------------|------------------------------------------ |
| git               | Git server (Gitea)                        |
| registry          | Container Registry (Docker/Harbor)        |
| software          | Software distribution server              |
| clamav            | ClamAV antivirus service                  |
| clamav-mirror     | ClamAV private mirror for pattern updates |
| ubuntu-mirror     | Ubuntu local mirror                       |
| redhat-mirror     | Redhat local mirror                       |


## Monitoring

Monitoring is it's own kind of domain providing services for IT, mainly but also auditors and corporate security.

| Service Name | Description                       |
|--------------|---------------------------------- |
| mon          | Monitoring (Grafana)              |
| logs         | Log server (Splunk, Grafana Loki) |


## Network

Services which are more network related.

| Service Name | Description                                      |
|--------------|------------------------------------------------- |
| ns           | DNS service                                      |
| ntp          | Time Service                                     |
| proxy        | Forward proxy for outgoing connections (Squid)   |
| vpn          | VPN server (WireGuard)                           |

