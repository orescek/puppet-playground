#!/usr/bin/env bash

set -e
if [ "$EUID" -ne "0" ] ; then
 echo "Script must be run as root." >&2
 exit 1
fi
if which puppet > /dev/null ; then
 echo "Puppet is already installed"
 #ln -s puppet/site.pp /etc/puppet/manifests/site.pp
 rm -rf /etc/puppetlabs/code/modules
 ln -s /vagrant/puppet/modules /etc/puppetlabs/code
 exit 0
fi

echo "Installing Puppet repo f"
wget -qO /tmp/puppetlabs-release-pc1-xenial.deb \
 https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
rm /tmp/puppetlabs-release-pc1-xenial.deb
aptitude update

#aptitude upgrade -y
echo Installing puppet
aptitude install -y puppet
echo "Puppet installed!"