# 🛠️ Plano de Estudo Prático — Runlevels/Targets, Shutdown e ACPID (Kali Linux)

Estudo guiado para domínio prático de gerenciamento de runlevels (targets), desligamento, reinicialização e uso do daemon `acpid`.

---

## 🧭 Módulo 1 — Definir runlevel/target padrão (boot target)

### 🎯 Exercício 1.1 — Identificar e alterar o target padrão

```bash
systemctl get-default
```

> Verifica o target atual (ex: `graphical.target`)

```bash
sudo systemctl set-default multi-user.target
```

> Define o modo texto como padrão. Reinicie e confirme.

```bash
sudo systemctl set-default graphical.target
```

> Restaura o modo gráfico padrão.

📌 **Objetivo**: Controlar o modo padrão de inicialização do sistema (terminal ou GUI).

---

## 🔄 Módulo 2 — Alternar entre runlevels/targets

### 🧪 Exercício 2.1 — Isolar targets (sem reiniciar)

```bash
sudo systemctl isolate multi-user.target
```

> Alterna para modo texto.

```bash
sudo systemctl isolate graphical.target
```

> Retorna para modo gráfico.

### 🧑‍🔧 Exercício 2.2 — Modo single-user (rescue)

```bash
sudo systemctl isolate rescue.target
```

> Entra em modo root com serviços mínimos. Saia com `exit` ou `reboot`.

📌 **Objetivo**: Alternar entre ambientes de manutenção, GUI e CLI dinamicamente.

---

## ⚙️ Módulo 3 — Desligar e reiniciar via terminal

### 🔋 Exercício 3.1 — Comandos essenciais

```bash
sudo poweroff       # Desliga imediatamente
sudo reboot         # Reinicia o sistema
sudo shutdown +2 "Desligando em 2 minutos"
sudo shutdown -c    # Cancela shutdown agendado
```

📌 **Objetivo**: Controlar o ciclo de vida do sistema via linha de comando.

---

## 📢 Módulo 4 — Alertar usuários antes de ações críticas

### 💬 Exercício 4.1 — Usar o `wall`

```bash
sudo wall "O sistema vai reiniciar em 1 minuto. Salve seu trabalho!"
```

📌 Combine com shutdown agendado para prática completa.

---

## 🔪 Módulo 5 — Gerenciar e finalizar processos

### 🔍 Exercício 5.1 — Usar `ps`, `kill` e `pkill`

```bash
ps aux | less                    # Ver todos os processos
kill <PID>                      # Finaliza educadamente
kill -9 <PID>                   # Finaliza à força
pkill nome_do_programa          # Finaliza pelo nome
```

📌 **Objetivo**: Saber lidar com processos travados ou pesados.

---

## 🔌 Módulo 6 — Trabalhar com acpid

### ⚡ Exercício 6.1 — Detectar eventos ACPI

```bash
systemctl status acpid
sudo apt install acpid
sudo systemctl enable --now acpid
```

```bash
sudo acpi_listen
```

> Pressione o botão de energia ou feche a tampa para capturar eventos.

Crie uma regra para desligar ao pressionar o botão:

```conf
# /etc/acpi/events/powerbtn
event=button/power.*
action=/sbin/poweroff
```

```bash
sudo systemctl restart acpid
```

📌 **Objetivo**: Responder a eventos físicos como botão de energia.

---

## 🧠 Simulado Prático

### Situação 1

> **Desejo que o Kali inicie sempre no modo texto:**

```bash
sudo systemctl set-default multi-user.target
```

---

### Situação 2

> **Interface gráfica travou. Preciso entrar em modo manutenção:**

```bash
sudo systemctl isolate rescue.target
```

---

### Situação 3

> **Preciso desligar o sistema em 5 minutos e avisar todos:**

```bash
sudo wall "Sistema vai desligar em 5 minutos, salve seu trabalho!"
sudo shutdown +5 "Desligando para manutenção"
```

---

### Situação 4

> **Um processo consome muita CPU e não responde:**

```bash
ps aux | grep nome
kill -9 <PID>
```

---

### Situação 5

> **O botão de energia não desliga o sistema. Quero configurar isso:**

```conf
# Criar /etc/acpi/events/powerbtn com:
event=button/power.*
action=/sbin/poweroff
```

```bash
sudo systemctl restart acpid
```

---

### Situação 6

> **Quero mudar para modo texto sem reiniciar:**

```bash
sudo systemctl isolate multi-user.target
```
