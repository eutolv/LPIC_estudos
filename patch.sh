#!/bin/bash

# ATENÇÃO: Este script apaga dados IRREVERSIVELMENTE. Use por sua conta e risco.
# Inspirado no botão "Apaga tudo" da investigação em Death Note.
# Pode desmontar sistemas de arquivos, sobrescrever arquivos com múltiplos passes
# e apagar espaço livre no disco. Você foi avisado.
# Aoesar de que um hacker conseguiria facilmente (e de forma bem mais eficiente)
# fazer tudo isso kkkk.......

cat << "EOF"
  ____       _       _       _    _             _           
 |  _ \ __ _| |_ ___| |__   | |  | | ___  _ __ | | _____  __
 | |_) / _` | __/ __| '_ \  | |  | |/ _ \| '_ \| |/ _ \ \/ /
 |  __/ (_| | || (__| | | | | |__| | (_) | | | | |  __/>  < 
 |_|   \__,_|\__\___|_| |_|  \____/ \___/|_| |_|_|\___/_/\_\
 
            [ !!  DANGER: DATA DESTRUCTION !! ]

EOF

echo "Você está prestes a APAGAR TODOS os dados da investigação."
echo "Inclui arquivos, logs, backups e espaço livre. Tudo será sobrescrito."
echo "Esta ação é IRREVERSÍVEL. Pode inutilizar o sistema."

read -p "Digite SIM para continuar: " confirm
if [[ "$confirm" != "SIM" ]]; then
  echo "Operação cancelada. Seus dados estão seguros... por enquanto."
  exit 1
fi

# Diretórios críticos da investigação
DATA_DIRS=(
  "/home/near/investigation_data"
  "/var/log/investigation_logs"
  "/mnt/backup/investigation"
)

echo -e "\n[1/4] Desmontando sistemas de arquivos (se necessário)..."
for dir in "${DATA_DIRS[@]}"; do
  mount_point=$(df --output=target "$dir" 2>/dev/null | tail -1)
  if mountpoint -q "$mount_point"; then
    echo "→ Desmontando $mount_point"
    umount "$mount_point" || echo "⚠️  Falha ao desmontar $mount_point"
  else
    echo "✓ $mount_point não está montado."
  fi
done

echo -e "\n[2/4] Apagando arquivos com sobrescrita de 10 passes..."
for dir in "${DATA_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo "→ Apagando conteúdo de $dir"
    find "$dir" -type f -exec shred -n 10 -z -u {} \;
    rm -rf "$dir"
  else
    echo "⚠️  Diretório $dir não encontrado, pulando..."
  fi
done

echo -e "\n[3/4] Apagando espaço livre com zero-fill..."
for dir in "${DATA_DIRS[@]}"; do
  device=$(df --output=source "$dir" 2>/dev/null | tail -1)
  if [ -b "$device" ]; then
    mount_point_temp="/mnt/temp_zerofill"
    mkdir -p "$mount_point_temp"
    echo "→ Montando $device em $mount_point_temp"
    mount "$device" "$mount_point_temp" || { echo "⚠️  Falha ao montar $device"; continue; }
    echo "→ Preenchendo espaço livre com zeros..."
    dd if=/dev/zero of="$mount_point_temp/zero.fill" bs=1M status=progress || echo "✓ Espaço livre apagado."
    rm -f "$mount_point_temp/zero.fill"
    umount "$mount_point_temp"
    rmdir "$mount_point_temp"
  else
    echo "⚠️  Dispositivo $device inválido ou não encontrado."
  fi
done

echo -e "\n[4/4] Finalizando operação."
echo "=== Apagamento completo. Sistema seguro... ou não. ==="
