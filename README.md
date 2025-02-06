# ASA-CLOUD: Infraestrutura como Código para Provedor de Conteúdo

![Docker](https://img.shields.io/badge/Docker-3.0%2B-blue)
![Git](https://img.shields.io/badge/Git-Branch%20Main-green)

Projeto desenvolvido em 3 sprints para simular os serviços de um provedor de conteúdo usando Docker, incluindo DNS, servidores web, e-mail, proxy reverso e acesso remoto.
---

## 📋 Descrição do Projeto

O **ASA-CLOUD** é uma infraestrutura como código (IaC) que replica os principais serviços de um provedor de internet, organizada em três `compose.yaml`:
1. **Provedor**: Serviços base (DNS, Proxy, E-mail, WebMail, SSH).
2. **Cliente 1**: Hospedagem web personalizada, SSH, Proxy.
3. **Cliente 2**: Hospedagem web personalizada, SSH, Proxy.

**Objetivo**: Implementar uma arquitetura escalável e replicável para serviços de rede, seguindo práticas DevOps.

---

## 🛠 Componentes da Solução

| Serviço              | Tecnologia       | Descrição                                  |
|----------------------|------------------|--------------------------------------------|
| **DNS**              | Bind9            | Zonas DNS para provedor e clientes (ex: `pipa.com`) |
| **Proxy Reverso**    | NGINX            | HTTPS com certificados autoassinados       |
| **Servidor Web**     | WordPress        | CMS oficial em containers Docker           |
| **E-mail**           | Postfix/Dovecot  | Serviços SMTP/IMAP                         |
| **Webmail**          | Roundcube        | Acesso web atrás do proxy                  |
| **Acesso Remoto**    | OpenSSH          | SSH com autenticação por usuário/senha     |

---

## ✅ Requisitos Técnicos

### Gerais
- Repositório Git único na branch `main`.
- Persistência de dados via volumes Docker.
- 3 arquivos `compose.yaml` (provedor, cliente1, cliente2).

### Específicos
- **DNS**:
  - Zonas para provedor e clientes (nomes de praias do RN).
  - Registros: A, NS, MX, CNAME.
- **Proxy**:
  - Configuração HTTPS com redirecionamento para servidores web.
- **SSH**:
  - Bloqueio de login root.
  - Autenticação por usuário/senha.
- **Webmail**:
  - Acesso somente via proxy reverso (NGINX).

---

## 🏗 Arquitetura atual (será atualizada conforme o andamento das sprints)

```
Projeto_ASA
├── provedor
│   ├── compose.yaml
│   ├── dns
│   │   ├── conf
│   │   │   ├── db.pipa.com
│   │   │   └── named.conf.local
│   │   └── Dockerfile
│   ├── mail
│   │   ├── conf
│   │   │   ├── 10-master.conf
│   │   │   ├── dovecot.conf
│   │   │   ├── main.cf
│   │   │   └── ssl
│   │   │       └── email.crt
│   │   ├── data
│   │   │   ├── felipe
│   │   │   └── rafael 
│   │   ├── Dockerfile
│   │   ├── init.sh
│   │   └── ssl
│   ├── proxy
│   │   ├── conf
│   │   │   ├── default.conf
│   │   │   ├── nginx.conf
│   │   │   └── ssl
│   │   │       ├── certificado.crt
│   │   │       └── certificado.key
│   │   ├── dockerfile
│   │   └── html
│   │       └── index.html
│   ├── ssh
│   │   └── Dockerfile
│   └── webmail
│       ├── conf
│       │   └── config.inc.php
│       └── Dockerfile
└── README.md
```

---

## 🚀 Como Executar

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/Rayver12/Projeto_ASA.git
   cd Projeto_ASA
   ```
2. **Implante os serviços**:
    ```bash
    # Provedor
    cd provedor
    docker compose up -d --build

    # Cliente 1
    cd ../cliente1
    docker compose up -d --build

    # Cliente 2
    cd ../cliente2
    docker compose up -d --build
    ```
3. **Acesse os serviços**:
    ```
    º Web: https://proxy.pipa.com
   (via proxy)

    º Webmail: https://webmail.pipa.com
  

    º SSH: Porta 22
    ```
---
## 📊 Critérios de Avaliação
| Critério	| Peso	| Descrição
|----------------------|------------------|--------------------------------------------|
| **Repositório Git**	| 10%	| Organização e código funcional
| **Funcionalidade**	| 80%	| Testes práticos em sala
| **Apresentação**	| 10%	| Demonstração para a turma

---
## 📌 Resultados Esperados

1. **Repositório organizado com toda a infraestrutura como código.**

2. **Serviços funcionais (DNS, Web, E-mail, Proxy, SSH).**

3. **Persistência de dados via volumes.**

4. **Testes básicos de conectividade e acesso.**

5. **Demonstração do conhecimento em Docker e redes.**

---
##  ⚠️ Outras informações:

    Criação de usuários e script .sh foram retirados de : https://github.com/Pikelot.

    Falta encontrar uma forma de manter os usuários após criação.

    Não sei se o SSH está implementado da forma esperada. 

