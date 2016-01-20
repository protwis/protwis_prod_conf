Production configuration for Protwis on linux servers using Puppet

Tested on **Ubuntu 14.04** and **CentOS 7** (may need tweaks for other systems).

WARNING: Running this script changes the configuration of your system and may override important settings, **DO NOT**
run this on a production server without proper testing in a container or virtual machine.

### Instructions

#### Install Git and Puppet:

Debian based systems (Debian, Ubuntu)

    sudo apt-get install git puppet

RedHat based systems (RedHat, CentOS, Fedora)

    sudo yum install epel-release git
    sudo yum install puppet

#### Create and change to /protwis directory

    sudo mkdir /protwis
    sudo chown $USER /protwis
    cd /protwis

#### Clone the protwis repository

    git clone https://github.com/protwis/protwis sites/protwis

#### Clone this repository and name it "conf" (the name is important):

    git clone https://github.com/protwis/protwis_prod_conf.git conf

#### Open repo:

    cd protwis_prod_conf

#### Run with Puppet:

    sudo puppet apply --modulepath protwis_puppet_modules manifests/default.pp
