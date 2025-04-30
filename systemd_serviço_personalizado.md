# 💻 Criando um Serviço Customizado com systemd

Este exercício tem como objetivo simular a criação de um serviço personalizado no Linux usando o `systemd`.

---

## 🧠 Conceito

O `systemd` é o sistema de inicialização padrão em muitas distribuições Linux modernas. Ele gerencia os serviços do sistema (daemons), sessões de usuários, montagem de dispositivos, logs, entre outros. O `systemctl` é a ferramenta usada para interagir com o `systemd`.

---

## 📁 Passo a Passo: Criando um Serviço

Vamos criar um serviço simples que imprime "Hello, systemd!" no terminal.

### 1. Criar o arquivo de unidade

```bash
sudo nano /etc/systemd/system/hello.service
```

### 2. Inserir o conteúdo abaixo

```ini
[Unit]
Description=Meu Serviço de Teste

[Service]
ExecStart=/bin/echo "Hello, systemd!"
Type=oneshot

[Install]
WantedBy=multi-user.target
```

### 3. Salvar e sair

No nano: `Ctrl+O`, `Enter`, depois `Ctrl+X`.

---

## 🔁 Carregar o novo serviço

```bash
sudo systemctl daemon-reload
```

---

## ▶️ Testar o serviço

```bash
sudo systemctl start hello
```

---

## 📊 Verificar o status

```bash
sudo systemctl status hello
```

---

## 📜 Ver o log do serviço

```bash
journalctl -u hello
```

---

## ✅ Conclusão

Esse exercício mostra como criar e gerenciar um serviço personalizado no Linux usando `systemd`. Esse mesmo processo pode ser usado para iniciar scripts próprios, programas ou rotinas automatizadas no boot do sistema.

---

Feito com ☕ e terminal por [@eutolv](https://github.com/eutolv)
```
