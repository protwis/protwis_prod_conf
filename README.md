Production configuration for Protwis on linux servers using Puppet

### Instructions

Tested on **Ubuntu 14.04** and **CentOS 7** (may need tweaks for other systems).

WARNING: Running this script changes the configuration of your system and may override important settings, **DO NOT**
run this on a production server without proper testing in a container or virtual machine.

#### Install Git and Puppet

Debian based systems (Debian, Ubuntu)

    sudo apt-get -y install git puppet

RedHat based systems (RedHat, CentOS, Fedora)

    sudo yum -y install epel-release git
    sudo yum -y install puppet

#### Create and change to /protwis directory

    sudo mkdir /protwis
    sudo chown $USER /protwis
    cd /protwis

#### Clone the protwis repository

    git clone https://github.com/protwis/protwis sites/protwis

#### Clone this repository and name it "conf" (the name is important)

    git clone --recursive https://github.com/protwis/protwis_prod_conf.git conf

#### Change to the cloned repo directory

    cd conf

#### Run with Puppet

    sudo puppet apply --modulepath protwis_puppet_modules manifests/default.pp

### Security notice

Your server is now set up. If your server is **exposed to the internet in any way**, please apply the following changes
in order the secure your server.

#### Change PostgreSQL default password

The default password for the PostgreSQL user "prowis" is "protwis". Choose a new password

    psql -U protwis -h localhost protwis
    \password
    \q

Then update the password in /protwis/sites/protwis/protwis/settings_local.py

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': 'protwis',
            'USER': 'protwis',
            'PASSWORD': 'YOUR NEW PASSWORD',
            'HOST': 'localhost',
        }
    }

#### Change the secret key in /protwis/sites/protwis/protwis/settings_local.py to a random key

In /protwis/sites/protwis/protwis/settings_local.py

    SECRET_KEY = 'a random key only you know'

#### Change the allowed hosts

In /protwis/sites/protwis/protwis/settings_local.py, change to allowed hosts to the hostname or IP address users will
use to access the protwis instance. This could be a domain name like "www.prowis.org" or an IP address like
"123.124.125.126"

    ALLOWED_HOSTS = ['123.124.125.126']
