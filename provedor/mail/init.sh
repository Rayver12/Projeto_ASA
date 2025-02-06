#!/bin/sh

# Verifica se os Maildirs já existem no volume, se não, copia do backup interno
if [ ! -d "/home/rafael/Maildir" ]; then
    cp -r /maildata/rafael /home/
fi

if [ ! -d "/home/felipe/Maildir" ]; then
    cp -r /maildata/felipe /home/
fi

chown -R rafael:rafael /home/rafael
chown -R felipe:felipe /home/felipe

# Iniciar serviços
service syslog-ng start
service dovecot start
service postfix start

# Manter container rodando
tail -F /var/log/mail.log
