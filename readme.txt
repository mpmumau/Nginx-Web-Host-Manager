================================================================================
Nginx Web Host Creator
================================================================================
Author:          Matthew Mumau (mpmumau@gmail.com)
Creation data:   March 9, 2014
License:         GNU General Public License (see included license.txt)
================================================================================
NOTE: This set of scripts is published under the GPL license. See license.txt 
for more information.
================================================================================

============================[Description]=======================================

This is a bash script that will assist with setting up dev, stage and live
environments for Nginx web applications.

============================[Installation]======================================

TODO: INSERT INSTALLATION INSTRUCTIONS

===============================[Usage]==========================================

1. Edit the "config_default" file to provide default values to use to generate hosts.
These values include MySQL credentials sufficient to create users and databases,
as well as various directories needed to run an Nginx web application.

2. Copy the "config_default" file to "config".

3. Run the create_web_host script as root.

4. Follow along with the script instructions to enter various values neccessary
to create the web host.

5. A tarball file will be placed in the root directory of a new user named with 
your domain name, minus the top-level domain (for example, example.com would 
create a user named example). That file will contain all credentials needed
you access the various components of the web host.

6. Scripts will also be placed in that new user's directory to be used to update
the various components of the host.

7. To completely remove a web host you have installed, run the delete_web_host
script as such:

  delete_web_host [DOMAIN_NAME]

[DOMAIN_NAME] refers to the domain name you used to create the host.

=======================[Additional Information]=================================

- The script will create a Linux user named with your domain name, minus the
top-level domain (for example, example.com would create a user named example).

- It will also create a Linux group named with your domain name, minus the 
top-level domain, prefaces by "wwww" (for example, example.com would create
a user name www-example).

- The script will create a git directory named after the domain name inside
of the main git directory specified in your "config" file.

