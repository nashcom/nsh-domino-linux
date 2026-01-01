# Picking the right Linux Distribution

## Introduction

In contrast to Windows, Linux as a free operating system allows you to pick from a large number of distributions.
Distributions are build from the Linux sources and each distribution makes it's own selection of versions and combination of packages.

Many distributions are based on other distributions or use their sources.
In addition different distributions use different package managers, which is a major difference between distributions.


## Rolling releases vs. stable long term releases

Running an enterprise application like Domino requires a stable Linux release.
A rolling release might introduce major versions of packages and the kernel completely unexpected.
In the enterprise world software needs to be tested.
Testing an enterprise software on a wild zoo of Linux distributions is almost impossible and would introduce risk.

So the first and most important criteria for picking a distribution is a **long term release**.


## Officially HCL tested Domino versions vs. supported versions

HCL picked [RedHat Enterprise Linux](https://www.redhat.com/de/technologies/linux-platforms/enterprise-linux/server) (RHEL)
and [SUSE Enterprise Linux](https://www.suse.com/products/server/) (SLES) as the two fully supported and tested distributions.
But meanwhile many other long term Linux distributions which meet the Linux kernel, **glibc** and **stdc++** lib versions are supported.

Supported means they should work and in case you have a problem, you can open a support ticket to get help on your Domino problem.
You cannot expect that HCL support knows about your Linux distribution and can help you with the distribution specific configuration or steps to troubleshoot.


## Linux vendor support

If you are running Domino in an enterprise environment you should have some kind of Linux support.
This can be either support from a vendor like RedHat, SUSE or Canonical (Ubuntu), or a company or a company specialized on Linux support.
Unless you really know what you are doing and have an own Linux team in your company some kind of external support makes a lot of sense.

RedHat Enterprise and SUSE Enterprise comes with support subscriptions out of the box.

Ubuntu has an opt-in support program [Ubuntu Pro](https://ubuntu.com/pro).
They offer as a personal free 5 machine subscription.

Redhat also offers a [free subscription for developers](https://developers.redhat.com/products/rhel/download)


## Pick one corporate Linux standard

Because Linux platforms can quite differ in the way they are setup and administrated, the package managers etc.
and also the support contracts you might want to have in place, it is wise to pick one strategic Linux distribution.

Domino admins should first check if there is corporate standard and if it fits with Domino.
Usually companies pick long term releases and this choose should usually work for Domino.


## How to pick your corporate standard Linux distribution

Many distributions are based on the source packages of another distribution or at least use the same package manager.
Administration of those distributions might still differ, because the distributions choice of the network package and other important Linux packages.
But basically it drills down to those 4 different categories of Linux distributions which are most commonly used.


## Redhat/CentOS Stream/Fedora based

Fedora is the fast moving distribution. Running itself is not advisable. But it is the source of many long term release distributions.
Before CentOS Stream many distributions have been build based on CentOS.
Meanwhile CentOS Stream is positioned between Fedora and RedHat Enterprise Linux.

This was the starting point for a couple of new distributions like RockyLinux and Alma Linux based on Redhat enterprise sources.
Any of those distributions based on a stable Redhat enterprise version and also CentOS Stream which dot releases become the dot releases of RedHat enterprise Linux are valid choice.

The package manager use is "yum" (actually most distributions switched to **dnf** the newer implementation that yum invokes under the covers).
Both are using RPM packages (RPM = RedHat Package Manager).

There are many other stable Linux versions based on the Fedora/RedHat stack. This includes AmazonLinux and Oracle Linux.
Both are valid choices. AmazoneLinux Linux is of special interest when running on AWS.
My personal preference for a free Linux distribution is still CentOS Stream, which is a stable long term release.

The safest bet is still Redhat Enterprise Linux, which is the build platform for Domino (Currently RHEL 9.1 which introduced the dependency for glibc 2.34+).


## SUSE Linux based

There are basically three different distributions:

- SUSE Enterprise Linux (SLES) the fully tested version of SUSE Linux
- openSUSE Leap a free SLES compatible Linux distribution using the same Linux package sources
- openSUSE Tumbleweed a rolling Linux release, which is not recommended to be used

SUSE also uses RPM packages. But they have their own package manager tool **zypper**.
It's similar to yum and easy to learn. But is a bit different.
In addition SUSE provides their own graphical or text based GUI tool "YaST" which is specially useful for admins who are no command line warriors.

SUSE also supports the **btrfs** file system, which is a modern file system supporting compression, de-duplication and snapshots.

The SUSE Linux distribution is around for a very long time -- and was the build platform for Domino initially by the way.


## Debian based

[Debian](https://www.debian.org/) provides major release versions, which are long term supported.
It has it's own package manager **dpkg** and packet format "Debian packages".

Debian also supports the "apt" package manager, which is also used on Ubuntu.

The package manager difference make administration a bit different to RedHat based environments.

Debian supports in place major version updates.
Experienced admins often favor Debian. It is also the base [Proxmox](https://www.proxmox.com) and [TrueNAS](https://www.truenas.com/) are built on.
But it isn't one of main releases picked by Domino admins today.
In addition the different package manager might not be supported by add-on application vendors (e.g. backup and other more OS level depending tools).


## Ubuntu

[Ubuntu](https://ubuntu.com/) also uses the Debian package format and uses the **dpkg** package manager. Ubuntu also supports in place major release updates.

Another important detail is that Ubuntu is the only distribution with out of the box fully integrated ZFS support out of the box.
ZFS is a very interesting file system also providing compression, de-duplication and snapshots.
The ZFS file system would be probably a good topic for a separate blog post.

The server side using the long term support (LTS) versions is becoming more popular among Domino admins.
But because of the different package manager, support for some add-on applications might not be available
(for example IBM Spectrum protect aka TDP is only supported on RedHat and SUSE type of distributions).

Ubuntu also provides a Desktop edition which can be used for corporate desktops.


## Ensure your Linux uses glibc 2.34+

Domino 14 is build on RedHat Enterprise Linux 9.1, which runs on glibc 2.34.
glibc is the GNU Linux C run-time which is an important component of every Linux distribution (beside Alpine, which is a different animal and not Domino supported).
To prepare for Domino 14, you should ensure today the platform supports 2.34+.


## Which one fits best?

This really depends on your requirements and what you already run. All of those long term release versions are a good fit with Domino.
It really depends on what you are used to. If you are used to RedHat/CentOS type of administration, it would be probably not wise to switch to Ubuntu or Debian and the other way round.

But if you are new to Linux, you have the pain of choice.
Again you should check what you already have in your company or what most software you use is supported on.

It's not just about Domino but also add-on software like backup and other more OS level depending software.
Probably for new admins a Redhat/CentOS based long term support distribution is the easier to learn platform where most resources are available.
