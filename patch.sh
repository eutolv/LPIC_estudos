#!/bin/bash

# ATENÇÃO: Este script é uma brincadeira baseada na cena do botão "apaga tudo" da investigação em Death Note, quando o Watari morre para o Rem.
# NÃO USE NA SUA MÁQUINA! Pode destruir dados importantes e deixar seu sistema inutilizável.
# Por sua conta e risco, não me responsabilizo por qualquer dano causado.  
# Um hacker realmente sabe fazer isso muito melhor e sem pedir ajuda kkk.

cat << "EOF"
  ____       _       _       _    _             _           
 |  _ \ __ _| |_ ___| |__   | |  | | ___  _ __ | | _____  __
 | |_) / _` | __/ __| '_ \  | |  | |/ _ \| '_ \| |/ _ \ \/ /
 |  __/ (_| | || (__| | | | | |__| | (_) | | | | |  __/>  < 
 |_|   \__,_|\__\___|_| |_|  \____/ \___/|_| |_|_|\___/_/\_\

            [ !!  DANGER: DATA DESTRUCTION !! ]

EOF

echo "Você está prestes a apagar TODOS os dados da investigação."
echo "Isso inclui arquivos, logs e backups críticos."
echo "Esta ação é IRREVERSÍVEL e pode inutilizar o sistema."

read -p "Deseja continuar? [S/N]: " confirm

case "$confirm" in
  [Ss]* )
    echo "Iniciando apagamento... Prepare-se para o fim."
    # Diretórios críticos da investigação (exemplo fictício)
    DATA_DIRS=(
      "/home/near/investigation_data"
      "/var/log/investigation_logs"
      "/mnt/backup/investigation"
    )

    for dir in "${DATA_DIRS[@]}"; do
      if [ -d "$dir" ]; then
        echo "Apagando e sobrescrevendo arquivos em $dir ..."
        find "$dir" -type f -exec shred -u -z {} \;
        rm -rf "$dir"
      else
        echo "Diretório $dir não encontrado, pulando..."
      fi
    done

    echo "=== Apagamento completo. Sistema seguro... ou não. ==="
    ;;
  [Nn]* )
    echo "Operação cancelada. Seus dados estão seguros... por enquanto."
    ;;
  * )
    echo "Entrada inválida. Abortando operação."
    ;;
esac
