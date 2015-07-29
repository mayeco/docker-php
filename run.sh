#!/bin/sh

if [ "${PHP_INI_ENV}" != "**None**" ]; then

    echo "=> php.ini settings"

    echo "" > /etc/php5/fpm/conf.d/zzz-php.ini
    echo ";PHP_INI_ENV settings" >> /etc/php5/fpm/conf.d/zzz-php.ini
    arr=$(echo ${PHP_INI_ENV} | tr ";" "\n")
    for x in $arr
    do
        echo "=> added php.ini line: $x"
        echo "$x" >> /etc/php5/fpm/conf.d/zzz-php.ini
    done
    echo "" > /etc/php5/fpm/conf.d/zzz-php.ini
    
    cp -f /etc/php5/fpm/conf.d/zzz-php.ini /etc/php5/cli/conf.d/zzz-php.ini

fi

exec php5-fpm
