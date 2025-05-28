
# 🛠️ Resetando Senha Esquecida no Kali Linux (VM) via GRUB

> 📌 Situação real vivida durante os estudos — esqueci a senha de usuário numa VM Kali durante um exercício. Aqui está o passo a passo do que funcionou.

## 📍 Cenário:
- Kali Linux rodando numa máquina virtual (VirtualBox/VMware)
- Senha esquecida (usuário root ou padrão)
- Acesso ao GRUB disponível

---

## 🔄 Etapas para resetar a senha

1. **Reinicie a VM**.
2. Na tela do **GRUB**, pressione rapidamente `e` para editar as opções de boot.
3. Encontre a linha que começa com:
   ```
   linux /boot/vmlinuz-...
   ```
4. Vá até o final dessa linha e substitua:
   ```
   ro quiet splash
   ```
   por:
   ```
   rw init=/bin/bash
   ```

---

## 🧠 Entendendo os parâmetros do boot

| Parâmetro         | Significado |
|------------------|-------------|
| `ro`             | *Read-Only*: monta o sistema de arquivos root como somente leitura. Padrão para evitar escrita durante o boot. |
| `rw`             | *Read-Write*: monta o sistema de arquivos root com permissão de leitura e escrita (necessário para alterar senha). |
| `quiet`          | Oculta mensagens do boot. Deixa a inicialização “limpa”. |
| `splash`         | Mostra uma imagem gráfica (tela de carregamento) em vez dos logs. |
| `init=/bin/bash` | Substitui o processo padrão de inicialização (`systemd`) por um shell Bash direto, como root. |

---

> ⚠️ **Problema real:** O teclado estava em layout americano (US), e eu não conseguia digitar a barra `/`.

**Solução**:
- Em teclado US, o `/` está no lugar do `-` do ABNT2.
- Use: `Shift + -` (à direita do ponto final) para digitar `/`.

---

## 🔐 Resetando a senha

Com o shell root carregado:

```bash
passwd
```

Ou, para um usuário específico:

```bash
passwd nome_do_usuario
```

Digite a nova senha duas vezes.

---

## ♻️ Reinicializando o sistema

Depois de trocar a senha:

```bash
exec /sbin/init
```

Ou:

```bash
reboot -f
```

---

## ✅ Resultado

Senha redefinida com sucesso e sistema funcionando. Uma situação tensa virou aprendizado prático!  
Ideal pra lembrar da importância de anotar senhas... ou dominar o GRUB 😅
