FROM ubuntu:latest
RUN apt update --fix-missing -y
RUN apt upgrade -y
RUN apt-get install postfix dovecot-imapd dovecot-pop3d syslog-ng vim -y

# Add users
RUN useradd -m rafael
RUN useradd -m felipe

RUN echo 'rafael:redes' | chpasswd
RUN echo 'felipe:redes' | chpasswd
#Criar diretório temporário para Maildir
RUN mkdir -p /maildata/rafael/Maildir /maildata/felipe/Maildir && \
    chown -R rafael:rafael /maildata/rafael && \
    chown -R felipe:felipe /maildata/felipe && \
    chmod -R 700 /maildata/*

# Copiar script de inicialização
COPY init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
