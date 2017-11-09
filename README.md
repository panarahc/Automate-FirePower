# Automate-FirePower
Cisco FirePower, lets face it, isn't a great platform to work with. It relies on custom perl scripts to configure the system with a clunky and limited clish shell by default which can make deploying, hardening, and managing these systems a nightmare. To alieviate the pain, this is an in the works project to automate Cisco Firepower vm deployment to the nth degree. This is still not a 100% seamless process but can be used to greatly assist the security admin in deploying SourceFire or FirePower to their enviroment.

# Configure Scripts
The aim is to create easy to use shell scripts that will act as a wrapper to the perl scripts that FirePower leverages to configure their sensors to get it up and running for ansible. These wrappers should be easy to use (options instead of long menus) but are for the more advanced user who is comfortable with command line.

# Playbooks
These are simple ansible playbooks to get the sensor in line with your standards and create a baseline to some extent. Please note that there is a real possibility that these could break the upgrade path as there are new toolsets being introduced to the enviroment and a 1GB shell script isn't exactly a stable upgrade path as it is..

Cisco FirePower has all the necessary prerequesits to run ansible, however you will either need to change the default shell from clish or add an account with bash or sh as the default shell. This should go without saying, but you will also have to configure your inventory and the device's network configuration to use ansible.

# Shell Examples
* sudo bash ./configure-network.sh --addr='IP Address' --dns='DNS Server' --gw='GateWay' --name='Host Name'

# Ansible Examples
* ansible-playbook -i inventory_file ./playbooks/add-manager.yml
  * -e 'host_key_checking=False' == Use this option if you've never logged into the devices through ssh. It's less safe than adding the hostkeys but much quicker, and if you're logging in through keypairs then host keys don't add too much value.
  * --private-key ~/.ssh/SourceFireKey == Login using a private key.
  * --limit 'hostname' == Limit to one device.
  
  
# Disclaimer
The scripts and software contained herein come with absolutly no waranty of any kind, explicitly stated or implied. Use at your own risk. It is up to the admin to make this work for them and to make their enviroment fluid and functional. I highly encourage everyone to automate, but before you do so, make sure you know what you're getting into and test, test, test!
