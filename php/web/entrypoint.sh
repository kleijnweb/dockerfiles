#!/usr/bin/env bash
set -eu

ENV_VARS=`printenv`
IGNORE_ENV_VARS=( "_" "DEBIAN_FRONTEND" "HOME" "HOSTNAME" "LS_COLORS" "no_proxy" "PATH" "PWD" "SHLVL" "TERM" )
for ENV_VAR in $ENV_VARS
do
  IFS== read ENV_VAR_NAME ENV_VAR_VALUE <<< "$ENV_VAR"
  if [[ ! ${IGNORE_ENV_VARS[*]} =~ "$ENV_VAR_NAME" ]] && [[ !  -z  $ENV_VAR_VALUE ]]; then
    echo "env[$ENV_VAR_NAME] = $ENV_VAR_VALUE" >> /usr/local/etc/php-fpm.d/www.conf
  fi
done

# Run the web services
service php-fpm start
nginx -g 'daemon off;'
