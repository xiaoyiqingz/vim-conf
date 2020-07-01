#########################################################################
# File Name: install_check.sh
# Author: zhangzhe
# mail: xiaoyiqingz@163.com
# Created Time: Wed 01 Jul 2020 10:52:21 AM CST
#########################################################################
#!/bin/bash

composer global require phpstan/phpstan
composer global require  nunomaduro/larastan

cp phpstan/phpstan.neno ~/
