
# 🖥️ Plano de Estudo Prático – 101.1 Identificar e Editar Configurações de Hardware (Linux Essentials)

Estudo hands-on para quem deseja dominar o reconhecimento e gerenciamento de hardware no Linux — focado em `lsmod`, `udev`, `sysfs`, `lspci`, `lshw` e muito mais.

---

## 🧩 Módulo 1 – Habilitar e Desabilitar Periféricos Integrados

### 🔧 Exercício 1.1 — Ativar/Desativar Módulos do Kernel

Visualize os módulos carregados:

```bash
lsmod
```

Remova um módulo (ex: `bluetooth`, `snd_hda_intel`, etc):

```bash
sudo modprobe -r nome_do_modulo
```

Recarregue o módulo:

```bash
sudo modprobe nome_do_modulo
```

📌 **Objetivo**: Controlar manualmente os drivers de hardware carregados no sistema.

---

## 💾 Módulo 2 – Identificar Tipos de Dispositivos de Armazenamento

### 🧪 Exercício 2.1 — Reconhecer discos e seus tipos

Liste os dispositivos conectados:

```bash
lsblk -o NAME,FSTYPE,SIZE,TYPE,MOUNTPOINT
```

Interprete:

* `sda`, `sdb`: discos SATA
* `nvme0n1`: discos NVMe
* `mmcblk`: cartões SD
* `loop`: imagens montadas
* `sr0`: unidade de CD/DVD

Detalhes de um disco:

```bash
sudo hdparm -I /dev/sda
```

Verifique se é SSD ou HDD:

```bash
cat /sys/block/sda/queue/rotational
# 0 = SSD | 1 = HDD
```

---

## 🧠 Módulo 3 – Determinar Recursos de Hardware (IRQ, DMA, I/O)

### 🔬 Exercício 3.1 — Consultar Arquivos de Recursos

Interrupções (IRQs):

```bash
cat /proc/interrupts
```

Acesso direto à memória (DMA):

```bash
cat /proc/dma
```

Portas de I/O:

```bash
cat /proc/ioports
```

📌 **Objetivo**: Entender como o kernel aloca recursos para dispositivos físicos.

---

## 🛠️ Módulo 4 – Ferramentas para Listar Hardware

### 🔍 Exercício 4.1 — Listar dispositivos USB

```bash
lsusb
```

### 🔎 Exercício 4.2 — Listar dispositivos PCI

```bash
lspci
```

### 🧰 Outros comandos úteis:

```bash
lshw               # Lista geral de hardware (pode exigir instalação)
sudo dmidecode     # Exibe dados da BIOS, RAM, etc (requer root)
```

---

## 🧬 Módulo 5 – Compreender sysfs, udev e dbus

### 📁 sysfs — Interface com o hardware via `/sys`

```bash
ls /sys/class/net
cat /sys/class/net/eth0/operstate
```

> Verifica interfaces e estado da conexão.

---

### 🔌 udev — Gerenciador dinâmico de dispositivos

Listar regras ativas:

```bash
ls /etc/udev/rules.d/
```

Monitorar eventos ao vivo (ex: plugar pendrive):

```bash
udevadm monitor
```

Ver informações detalhadas:

```bash
udevadm info -a -p $(udevadm info -q path -n /dev/sda)
```

---

### 🗣 dbus — Comunicação entre hardware e software

Ver serviços ativos via dbus:

```bash
busctl
```

> Usado por GNOME, NetworkManager, etc., para interagir com hardware de forma assíncrona.

---

## ✅ Simulado Prático – 101.1: Situações Reais

### ⚙️ Situação 1

**Você precisa listar todos os dispositivos PCI e identificar a placa de rede.**

```bash
lspci | grep -i ethernet
```

---

### 🔊 Situação 2

**O som parou de funcionar. Você suspeita do driver de áudio.**

```bash
lsmod | grep snd
sudo modprobe -r snd_hda_intel
sudo modprobe snd_hda_intel
```

---

### 💽 Situação 3

**Quer saber se `/dev/sda` é SSD ou HDD.**

```bash
cat /sys/block/sda/queue/rotational
# 0 = SSD | 1 = HDD
```

---

### 📦 Situação 4

**Você conectou um pendrive, mas ele não montou. Quer monitorar eventos do udev.**

```bash
udevadm monitor
```

---

### 🌐 Situação 5

**Deseja listar todas as interfaces de rede e saber se `eth0` está ativa.**

```bash
ls /sys/class/net
cat /sys/class/net/eth0/operstate
```

---

### 🧬 Situação 6

**Um processo tenta acessar a BIOS via dbus. Como verificar os serviços?**

```bash
busctl
```
