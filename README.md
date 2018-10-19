# NOTE: This is work in progress!

# Compact Wordpress Docker

This is dependency free Docker image containing Wordpress setup and WP-CLI, to make it up and running, call: 
docker-compose up

The image contains MariaDB database, therefore additional linking is not required, in fact simplification was the driving factor to develop this piece of code.
The image is meant for scenarios where: 
* it's required to setup wordpress in a simple way - no need to use docker-compose, or container linking
* there is the need to make snapshoots - docker commit/load can be used for this purpose
* temporary Wordpres for experimenting or testing has to be set

Compact-Wordpress is build upon Alpine Linux to minimize resource footprint.
