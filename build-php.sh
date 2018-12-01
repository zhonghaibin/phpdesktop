#!/bin/bash

# READ ME:
# - Tested on Ubuntu 14.04 64-bit.
# - Before running script download sources from http://php.net/downloads.php
#   and extract them to "build/php*/" directory (create build/ directory).

# Exit immediately if a command exits with a non-zero status.
set -e

# Print all executed commands to terminal.
# set -x

root_dir=$(dirname $0)
cd ${root_dir}/build/php*/
php_dir=$(pwd)
echo "Configure PHP..."
./configure \
    --prefix=${php_dir}/dist-install \
    --exec-prefix=${php_dir}/dist-install-exec-prefix
echo "Build PHP..."
make
echo "Copy php-cgi to build/bin/"
cp sapi/cgi/php-cgi ../bin/
echo "OK completed."
