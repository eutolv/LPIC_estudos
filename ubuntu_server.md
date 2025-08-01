````markdown
# 🚀 Meu Guia Completo: Instalando Ubuntu Server 24.04 LTS no VirtualBox e Configurando SSH com Chave RSA 🔐

Este é o meu passo a passo para instalar o Ubuntu Server 24.04 LTS em uma máquina virtual Oracle VirtualBox, configurar o acesso remoto via SSH e autenticação por chave RSA. Ideal para meus estudos da certificação LPIC-1 e para ter um servidor Linux básico rodando para aprendizado. 🎓🐧

---

## 📋 Índice

- [1. Baixei a ISO do Ubuntu Server 🖥️](#1-baixei-a-iso-do-ubuntu-server-🖥️)  
- [2. Criei a VM no VirtualBox 🛠️](#2-criei-a-vm-no-virtualbox-🛠️)  
- [3. Instalei o Ubuntu Server 💻](#3-instalei-o-ubuntu-server-💻)  
- [4. Ajustei o layout do teclado para ABNT2 ⌨️](#4-ajustei-o-layout-do-teclado-para-abnt2-⌨️)  
- [5. Instalei e configurei o OpenSSH Server 🔒](#5-instalei-e-configurei-o-openssh-server-🔒)  
- [6. Configurei a autenticação SSH por chave RSA 🗝️](#6-configurei-a-autenticacao-ssh-por-chave-rsa-🗝️)  
- [7. Próximos passos que pretendo seguir 📈](#7-próximos-passos-que-pretendo-seguir-📈)

---

## 1. Baixei a ISO do Ubuntu Server 🖥️

- Acessei o site oficial do Ubuntu: [https://ubuntu.com/download/server](https://ubuntu.com/download/server) 🌐  
- Baixei a versão 24.04.2 LTS (Long Term Support).

---

## 2. Criei a VM no VirtualBox 🛠️

- Abri o Oracle VirtualBox e criei uma nova VM com as seguintes configurações:  
  - Nome: Ubuntu Server 24.04  
  - Tipo: Linux 🐧  
  - Versão: Ubuntu (64-bit)  
  - Memória RAM: 2048 MB  
  - Disco rígido: Dinâmico, 20 GB 💾  
- Adicionei a ISO do Ubuntu Server no drive de CD/DVD da VM (Configurações → Armazenamento).  
- Configurei o adaptador de rede para **modo bridge** para facilitar o acesso via rede local. 🌉  
- Ajustei a ordem de boot para iniciar pelo disco rígido após a instalação (desmontei a ISO depois da instalação).

---

## 3. Instalei o Ubuntu Server 💻

- Iniciei a VM e segui o instalador do Ubuntu Server.  
- Usei `Tab` para navegar, `Enter` para confirmar e `Espaço` para marcar opções, já que as setas nem sempre funcionavam. ⌨️  
- Escolhi idioma, layout de teclado, nome do host, criei o usuário e defini outras opções básicas.  
- Pulei a etapa de importar chaves SSH do GitHub.  
- Na etapa dos Featured Server Snaps, deixei como estava (pode escolher ou pular).  
- Aguardei a instalação concluir. ⏳  
- Removi a ISO do drive virtual para evitar reiniciar o instalador.  
- Ajustei a ordem de boot para iniciar pelo disco rígido.  
- Reiniciei a VM e fiz login com o usuário criado.

---

## 4. Ajustei o layout do teclado para ABNT2 ⌨️

Após o login, ajustei o teclado para o padrão brasileiro ABNT2 com o comando:

```bash
sudo dpkg-reconfigure keyboard-configuration
````

* Selecionei `Generic 105-key (Intl) PC`
* Escolhi `Brazil` como país 🇧🇷
* Escolhi `Portuguese (Brazil, ABNT2)`
* Optei por `No compose key`
* Finalizei as opções conforme padrão.

Depois, apliquei a configuração com:

```bash
sudo setupcon
```

Testei o teclado com caracteres especiais como `ç`, `?`, `~`.

---

## 5. Instalei e configurei o OpenSSH Server 🔒

Atualizei os pacotes e instalei o servidor SSH para permitir acesso remoto:

```bash
sudo apt update
sudo apt install openssh-server -y
```

Verifiquei se o serviço estava ativo:

```bash
sudo systemctl status ssh
```

Ativei o serviço para iniciar junto com o sistema:

```bash
sudo systemctl enable ssh
```

(Se usar firewall UFW, permiti SSH com: `sudo ufw allow ssh`)

---

## 6. Configurei a autenticação SSH por chave RSA 🗝️

### 6.1 Gereei par de chaves no meu computador local (host)

No meu computador host (não na VM), executei:

```bash
ssh-keygen -t rsa -b 4096
```

* Pressionei Enter para aceitar o local padrão (`~/.ssh/id_rsa`).
* Opcionalmente, defini uma senha para a chave ou deixei em branco.

### 6.2 Copiei a chave pública para o servidor

Ainda no host, enviei a chave para o servidor:

```bash
ssh-copy-id herlitz@IP_DO_SERVIDOR
```

Substituí `herlitz` pelo meu usuário no servidor e `IP_DO_SERVIDOR` pelo IP da VM (ex: 192.169.58.99).

Digitei a senha do usuário quando solicitado.

### 6.3 Testei acesso sem senha

Conectei sem senha:

```bash
ssh herlitz@IP_DO_SERVIDOR
```

Funcionou sem pedir senha, a autenticação por chave estava configurada corretamente. 🎉

---

## 7. Próximos passos que pretendo seguir 📈

Depois dessa configuração básica, pretendo adicionar funcionalidades comuns para deixar meu servidor seguro e funcional:

* 🔥 **Firewall básico:** configurar o UFW para liberar apenas serviços essenciais.
* 🔄 **Atualizações automáticas:** manter o sistema sempre atualizado.
* 📊 **Monitoramento:** instalar ferramentas como `htop`, `nmon` ou `glances`.
* 💾 **Backups:** configurar rotinas de backup automatizado.
* 🛠️ **Serviços adicionais:** instalar e configurar servidores web (Apache, Nginx), bancos de dados, containers (Docker), etc.

---

> **Nota:** Vou atualizar este guia com mais funcionalidades simples para ajudar nos meus estudos LPIC-1.

---

# 🎉 Estou MUITO feliz com essa conquista, kk! Meu servidor Linux está no ar e pronto para os próximos passos. 🚀🐧

```
