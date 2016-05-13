# Puppet
Puppet Training Code

Objective : Setup One Node Hadoop Using Puppet
Contains hadoop module which is configured to install puppet.
Used the same module in site.pp

Go through site.pp and then init.pp in modules.

If running puppet enterprise, place the hadoop module in /etc/puppetlabs/code/environments/production/modules  and add 'include hadoop' in /etc/puppetlabs/code/environments/production/manifests/site.pp
