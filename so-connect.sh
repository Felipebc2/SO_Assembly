#!/usr/bin/env bash

set -euo pipefail

SERVER="52.91.140.115"

if ! command -v sshpass &>/dev/null; then
    echo "sshpass nao encontrado."
    read -rp "Deseja instalar agora? (sudo pacman -S sshpass) [Y/N]: " INST
    case "${INST^^}" in
        Y|YES)
            sudo pacman -S --noconfirm sshpass
            ;;
        *)
            echo "Instale manualmente: sudo pacman -S sshpass"
            exit 1
            ;;
    esac
fi

read -rp "Usuario SSH: " USER
read -rsp "Senha: " PASS
echo

sshpass -p "$PASS" ssh -o StrictHostKeyChecking=no "${USER}@${SERVER}"
