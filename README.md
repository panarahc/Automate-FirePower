# Automate-FirePower
Cisco FirePower, lets face it, isn't a great platform to work with. It relies on custom perl scripts to configure the system with a clunky and limited clish shell by default which can make deploying, hardening, and managing these systems a nightmare. To alieviate the pain, this is an in the works project to automate Cisco Firepower vm deployment to the nth degree. This is still not a 100% seamless process but can be used to greatly assist the security admin in deploying SourceFire or FirePower to their enviroment.

# Configure Scripts
The aim is to create easy to use shell scripts that will act as a wrapper to the perl scripts that FirePower leverages to configure their sensors. These wrappers should be easy to use (options instead of long menus) but are for the more advanced user who is comfortable with command line.

# Playbooks
These are simple ansible playbooks to get the sensor in line with your standards and create a baseline to some extent. Please note that there is a real possibility that these could break the upgrade path as there are new toolsets being introduced to the enviroment and a 1GB shell script isn't exactly a stable upgrade path as it is..

