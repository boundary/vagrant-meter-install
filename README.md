# Example Meter Install via Shell Script

Example of a lights out install via bash script of TrueSight Pulse Meter for the following operating system environments:

- Centos 7.0
- Centos 6.6
- Ubuntu 12.04
- Ubuntu 14.04

## Prerequisites

- Vagrant 1.7.2 or later. Vagrant can be downloaded [here](https://www.vagrantup.com/downloads.html)
- VirtualBox 4.3.2.6 or later. VirtualBox can be downloaded [here](https://www.virtualbox.org/wiki/Downloads)

## Installation

### Getting Started

The TrueSight Pulse meter is installed on each of the virtual machines via the `install.sh` script. TrueSight Pulse Meter installation requires that the _api token_ be known at install time. The TrueSight Pulse API Token can be found in the _Settings_ -> _Account_ dialog in the TrueSight Pulse web interface.

### List of Platforms to Virtual Machine Mapping

The table below provides the mapping of platform to virtual machine name that is used later to start a virtual machine for testing plugins.

| Platform             | Virtual Machine Name  |
|:---------------------|:---------------------:|
|Centos 6.6            |`centos-6.6`           |
|Centos 7.0            |`centos-7.0`           |
|Ubuntu 12.04          |`ubuntu-12.04`         |
|Ubuntu 14.04          |`ubuntu-14.04`         |


### Starting a Virtual Machine

With the TrueSight Pulse API token perform the following:

1. Either checkout or clone the git repository ()[]
2. Issue the following command, the target platforms are listed in the table below:
```
$ API_TOKEN=<api token> vagrant up <virtual machine name>
```


### Stopping a Virtual Machine

```
$ vagrant halt <virtual machine name>
```

### Destroying a Virtual Machine

```
$ vagrant destroy <virtual machine name>
```




