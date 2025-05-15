
# 🐧 Entendendo a Inicialização do Linux — GRUB, Kernel e Logs

## 🎯 Objetivo

Documentar de forma prática o processo de boot no Linux, incluindo:
- Diferença entre BIOS e UEFI
- Estágios da inicialização
- Modificação do GRUB
- Testes com parâmetros do kernel
- Leitura de mensagens de boot

---

## 🖥️ Ambiente

- **Distro:** Kali Linux  
- **Virtualização:** Oracle VM VirtualBox  
- **Shell:** Bash  
- **Usuário:** root  

---

## 1. 🧩 BIOS vs UEFI – Métodos de Inicialização

| Item                    | BIOS (Legacy)                               | UEFI                                         |
|-------------------------|----------------------------------------------|----------------------------------------------|
| Tipo de firmware        | Antigo, baseado em 16-bit                    | Moderno, baseado em 32/64-bit                |
| Interface gráfica       | Não                                          | Sim (às vezes)                               |
| Suporte a partições     | MBR (até 2 TB e 4 partições primárias)       | GPT (suporte a discos > 2 TB e + partições)  |
| Armazenamento de config | ROM                                          | Memória NVRAM                                |
| Segurança               | Nenhuma                                      | Suporte a Secure Boot                        |

---

## 2. 🌀 Estágios da Inicialização

1. **POST (Power-On Self Test)** – feito pela BIOS/UEFI
2. **Bootloader (GRUB)** – carrega o kernel
3. **Kernel** – inicializa o hardware e monta o root
4. **Init/systemd** – inicia serviços e o ambiente
5. **Login** – terminal ou interface gráfica

---

## 3. 🔧 Configurando o GRUB

### Exibir o menu do GRUB

1. Edite o arquivo:
   ```bash
   sudo nano /etc/default/grub
````

2. Modifique ou adicione:

   ```bash
   GRUB_TIMEOUT=5
   GRUB_TIMEOUT_STYLE=menu
   ```

3. Atualize o GRUB e reinicie:

   ```bash
   sudo update-grub
   sudo reboot
   ```

---

## 4. 🧪 Teste Prático: `init=/bin/bash`

### Passos:

1. No menu do GRUB, pressione `e` na entrada padrão.
2. Encontre a linha que começa com `linux`.
3. Adicione ao final:

   ```bash
   init=/bin/bash
   ```
4. Pressione `Ctrl + X` ou `F10`.

### Resultado:

* Sistema inicializa em um shell root (`#`)
* Nenhum serviço do systemd é iniciado

### Comandos úteis nesse modo:

```bash
whoami                # Confirma o usuário (root)
cat /proc/cmdline     # Mostra os parâmetros do kernel
mount -o remount,rw / # Permite editar arquivos
```

---

## 5. 📦 Parâmetros Comuns do Kernel

| Parâmetro        | Efeito                                                                      |
| ---------------- | --------------------------------------------------------------------------- |
| `init=/bin/bash` | Inicia um shell como root diretamente, sem systemd                          |
| `single`         | Modo de usuário único (modo de recuperação)                                 |
| `nomodeset`      | Impede que drivers de vídeo ativem o modo gráfico automaticamente           |
| `acpi=off`       | Desativa o gerenciamento de energia, útil em certos hardwares problemáticos |

---

## 6. 🛠️ Leitura de Mensagens de Inicialização

### `dmesg` – mensagens do kernel

```bash
dmesg | less
dmesg | grep -i error   # Ver apenas erros
```

### `journalctl` – logs do systemd

```bash
journalctl            # Mostra todos os logs
journalctl -b         # Apenas o boot atual
journalctl -p err -b  # Apenas erros do boot atual
```

---

## ✅ Conclusões

* Aprendemos a editar o GRUB e usar parâmetros para testes.
* Exploramos o `init=/bin/bash` e vimos como o sistema se comporta sem systemd.
* Conhecemos ferramentas essenciais para leitura de logs: `dmesg` e `journalctl`.
* Entendemos diferenças práticas entre BIOS e UEFI.

---

## 📎 Referências

* [GNU GRUB Manual](https://www.gnu.org/software/grub/manual/grub/grub.html)
* [Arch Wiki - Kernel Parameters](https://wiki.archlinux.org/title/Kernel_parameters)
* `man dmesg`, `man journalctl`

---

```
