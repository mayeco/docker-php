#!/bin/sh

if [ "${PHP_INI_ENV}" != "**None**" ]; then

    echo "=> php.ini settings"

    echo "" >> /etc/php5/fpm/php.ini
    echo ";PHP_INI_ENV settings" >> /etc/php5/fpm/php.ini
    arr=$(echo ${PHP_INI_ENV} | tr ";" "\n")
    for x in $arr
    do
        echo "=> added php.ini line: $x"
        echo "$x" >> /etc/php5/fpm/php.ini
    done

fi

exec php5-fpm
