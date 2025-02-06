FROM ubuntu:latest

RUN apt update && apt install -y openssh-server vim
RUN mkdir /var/run/sshd

#criar rafaels, mais tarde ver como fazer integração automática
RUN useradd -m rafael
RUN useradd -m felipe

# Setar senhas
RUN echo 'root:1234567' | chpasswd
RUN echo "rafael:redes" | chpasswd
RUN echo "felipe:redes" | chpasswd

# tirando login de root
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
