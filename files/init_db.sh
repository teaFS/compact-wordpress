#!/bin/sh

# This is mariadb database initialisation script, some code here is based on: 
# https://github.com/MariaDB/server/blob/5.5/scripts/mysql_secure_installation.sh
# 

do_query() {
    echo "$1" >$command
    #sed 's,^,> ,' < $command  # Debugging
    mysql --defaults-file=$config <$command
    return $?
}

# === Clean up database first: 

# remove anonymous users: 
do_query "DELETE FROM mysql.user WHERE User='';"

# remove remote root access: 
do_query "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

# remove test database: 
do_query "DROP DATABASE IF EXISTS test;"
# ...and associated privilages: 
do_query "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

# reload privilege tables to commit changes: 
do_query "FLUSH PRIVILEGES;"

# === Database cleaned, 
