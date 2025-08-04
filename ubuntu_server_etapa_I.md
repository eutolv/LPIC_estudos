🖥️ Servidor Ubuntu - Etapa 1: Configuração Básica e Ambientação

✅ Objetivo

Configurar o ambiente básico de um servidor Ubuntu, com foco em atualização, gerenciamento de usuários, acesso remoto e compreensão da estrutura do sistema.

🔧 1. Atualização do Sistema

sudo apt update && sudo apt upgrade -y

📋 2. Informações do Sistema

uname -a              # Kernel e arquitetura
lsb_release -a        # Versão do Ubuntu
hostnamectl           # Informar ou alterar hostname
uptime                # Tempo ligado e carga

Exemplo de alteração do hostname:

sudo hostnamectl set-hostname herlitz-core

👤 3. Gerenciamento de Usuários

sudo adduser tolv
sudo usermod -aG sudo tolv
su - tolv

🔐 4. Acesso SSH com Chave RSA

Instalado OpenSSH:

sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

Verificação:

sudo systemctl status ssh
ip a

Copiada chave RSA da máquina cliente para o servidor com:

ssh-copy-id tolv@ip-do-servidor

📂 5. Estrutura de Diretórios do Linux

/etc → arquivos de configuração

/home → diretórios pessoais

/var → logs e arquivos variáveis

/usr, /bin, /sbin → binários e utilitários do sistema

Comandos:

ls -la /etc
ls -la /home
ls -la /var/log

🔒 6. Permissões de Arquivo

ls -l /home/tolv
sudo chown tolv:tolv arquivo.txt
chmod 644 arquivo.txt

⚙️ 7. Comandos Essenciais de Diagnóstico

top / btop / htop      # Monitoramento
free -m               # Memória RAM
ps aux | grep nome     # Buscar processo
df -h                 # Espaço em disco
kill / killall        # Finalizar processo

📜 8. Logs do Sistema

sudo tail -f /var/log/syslog
sudo journalctl -xe
sudo journalctl -p err -b

📊 Leitura do btop (Exemplo Real)

RAM:

Total: 1,92 GiB

Usada: 19%

Cache: 42%

Livre: 42%

Disco:

Root: 100% (58,5 MiB usados – referência interna do btop)

Boot: 11% usado

Swap: 100% livre

Processo mais ativo: kworker com 0,2% de CPU

Interpretação: Servidor está estável, com uso baixo de recursos.

🧩 Próximos passos

Etapa 2: Redes e Serviços (configurar Apache/Nginx, diagnosticar conexões, configurar firewall etc.)
