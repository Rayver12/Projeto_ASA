# ASA-CLOUD: Infraestrutura como Código para Provedor de Conteúdo

![Docker](https://img.shields.io/badge/Docker-3.0%2B-blue)
![Git](https://img.shields.io/badge/Git-Branch%20Main-green)

Projeto desenvolvido em 3 sprints para simular os serviços de um provedor de conteúdo usando Docker, incluindo DNS, servidores web, e-mail, proxy reverso e acesso remoto.

---

## 📋 Descrição do Projeto

O **ASA-CLOUD** é uma infraestrutura como código (IaC) que replica os principais serviços de um provedor de internet, organizada em três `docker-compose.yml`:
1. **Provedor**: Serviços base (DNS, Proxy, E-mail).
2. **Cliente 1**: Hospedagem web personalizada.
3. **Cliente 2**: Hospedagem web adicional com configurações específicas.

**Objetivo**: Implementar uma arquitetura escalável e replicável para serviços de rede, seguindo práticas DevOps.

---

## 🛠 Componentes da Solução

| Serviço              | Tecnologia       | Descrição                                  |
|----------------------|------------------|--------------------------------------------|
| **DNS**              | Bind9            | Zonas DNS para provedor e clientes (ex: `pipa.asa.br`) |
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
- 3 arquivos `docker-compose.yml` (provedor, cliente1, cliente2).

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

## 🏗 Arquitetura

```
Projeto_ASA
├── provedor/
│ ├── docker-compose.yml (DNS, Proxy, E-mail)
│ └── volumes/ (dados persistentes)
├── cliente1/
│ ├── docker-compose.yml (Web1, Web2, SSH)
│ └── volumes/
├── cliente2/
│ ├── docker-compose.yml (Web2, Web2, SSH)
│ └── volumes/
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
    docker-compose up -d

    # Cliente 1
    cd ../cliente1
    docker-compose up -d

    # Cliente 2
    cd ../cliente2
    docker-compose up -d
    ```
3. **Acesse os serviços**:
    ```
    º Web: https://pipa.asa.br (via proxy)

    º Webmail: https://webmail.pipa.asa.br

    º SSH: ssh usuario@ip_do_servidor -p 22
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
