#!/bin/sh

if [ "${PHP_INI_ENV}" != "**None**" ]; then

    cd /etc/php5/mods-available/

    echo "=> php.ini settings"
    rm -f zzz-php.ini
    
    echo "" > zzz-php.ini
    echo ";PHP_INI_ENV settings" >> zzz-php.ini

    arr=$(echo ${PHP_INI_ENV} | tr ";" "\n")
    for x in $arr
    do
        echo "=> added php.ini line: $x"
        echo "$x" >> zzz-php.ini
    done

    echo "" >> zzz-php.ini
    
    cd /etc/php5/cli/conf.d/
    ln -s -f ../../mods-available/zzz-php.ini zzz-php.ini
    
    cd /etc/php5/fpm/conf.d/
    ln -s -f ../../mods-available/zzz-php.ini zzz-php.ini

fi

cd /var/www/

exec php5-fpm
