
# How to get started Domino on Linux


## 1. Pick a distribution

- If there is already a corporate distribution, pick it **if this is an LTS distribution with Domino support**
- Otherwise, the recommendation is **Ubuntu LTS**


## 2. Decide if Native Linux or containerized

If there are no special requirements, **containers are a good choice**
Containers are also a good choice for all Domino add-on products such as:

- Verse
- Traveler
- REST API
- Leap

Containers are also a good choice for **adding custom add-ons** for a standardized deployment
Even if you pick a native installation, the container install tooling is also available for native Linux installs.

The container project supports both installation modes even it was initially only intended for container based installs.

## 3. Downloading Domino WebKits

In all type of deployments the installation sources are always HCL Domino WebKits downloaded from [My HCLSoftware Portal](https://my.hcltechsw.com/).
There is an automated [Domino Download script](https://nashcom.github.io/domino-startscript/domdownload/) which can be leveraged by the Domino container build script and also native installers.


## 4.1 Install Domino using the native installer

The fastest path to install the Domino is to leverage the [Domino One-Touch Installer](https://nashcom.github.io/domino-startscript/install_domino/) script.
But you can also download the software and install it manually. Example installation steps are provided [here](https://nashcom.github.io/domino-startscript/install_domino/).

The all in one convenience script can be executed directly from the GitHub project:

```
curl -sL https://raw.githubusercontent.com/nashcom/domino-startscript/main/install_domino.sh | bash -
```


## 4.2 Run the Domino Server via Domino systemd service

The Domino Start Script provides a [systemd](https://systemd.io/) script to start Domino.

To invoke the start script just run the `domino` command.
The `domino` command also provides a OTS configuration option for Domino first and additional server setups.

```
domino setup
domino start
```

## 4.2 Build and run the Domino container image

Building and running container images involves multiple steps.
But there is tooling available to simplify to setup a container build and run-time environment, build the image, configure and run a container.


### 4.2.1 Install a container build environment

The Domino Start Script provides a convenience script to setup a container build and run-time environment.

Check the steps provided in [Container Environment Convenience Script ](https://nashcom.github.io/domino-startscript/install_container_env/) documentation.

The convenience script performs three main tasks

- Installs Docker as a run-time/build environment
- Clones Domino Container GitHub repository
- Clones Domino Start Script container GitHub repository

The install script can be directly executed from GitHub repository

```
curl -sL https://raw.githubusercontent.com/nashcom/domino-startscript/main/install_container_env.sh | bash -
```


### 4.2.2 Build the container image

Once the [Domino Container Image](https://opensource.hcltechsw.com/domino-container/) GitHub repository is cloned the build script can be used to build a Domino container image.

```
cd /local/github/domino-container
./build.sh
```

The build script tries to automatically download Domino WebKits from My HCLSoftware portal as part of the build process.


### 4.2.3 Run the container image

Once the image is created, the container can be started levering the [Domino Container Control](https://nashcom.github.io/domino-startscript/dominoctl/) script.

First check and update the container configuration

```
dominoctl cfg
```

Domino Once Touch Setup is integrated into the container control script.
For a first server setup the setup is simple because no server.id needs to be passed to the setup process.
When setting up an additional server a server.id needs to be passed either via the volume.

```
dominoctl setup
dominoctl start
```
