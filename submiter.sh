#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Uso: $0 /caminho/para/arquivo.s [caminho_do_exercicio]"
    exit 1
fi

ASM_FILE="$1"
EXERCICIO_PATH="${2:-./exercicio}"

if [[ ! -f "$ASM_FILE" ]]; then
    echo "Erro: arquivo .s não encontrado: $ASM_FILE"
    exit 1
fi

BASE_DIR="$(dirname "$ASM_FILE")"
BASE_NAME="$(basename "$ASM_FILE" .s)"

OBJ_FILE="$BASE_DIR/${BASE_NAME}.o"
PROG_FILE="$BASE_DIR/${BASE_NAME}"
BIN_FILE="$BASE_DIR/${BASE_NAME}-instrucoes.bin"

echo "Arquivo ASM: $ASM_FILE"
echo "Objeto:      $OBJ_FILE"
echo "Executável:  $PROG_FILE"
echo "Binário .text: $BIN_FILE"
echo

echo "[1/4] Montando arquivo .s -> .o"
as "$ASM_FILE" -o "$OBJ_FILE"

echo "[2/4] Ligando arquivo .o -> executável"
ld "$OBJ_FILE" -o "$PROG_FILE"

echo "[3/4] Extraindo seção .text -> binário raw"
objcopy --dump-section .text="$BIN_FILE" "$PROG_FILE"

echo "[4/4] Exibindo bytes extraídos"
if command -v xxd >/dev/null 2>&1; then
    xxd "$BIN_FILE"
elif command -v hd >/dev/null 2>&1; then
    hd "$BIN_FILE"
else
    echo "Nem xxd nem hd estão disponíveis."
fi

echo
read -r -p "Deseja submeter agora com: cat \"$BIN_FILE\" | \"$EXERCICIO_PATH\" ? [Y/N]: " RESP

case "${RESP^^}" in
    Y|YES)
        if [[ ! -x "$EXERCICIO_PATH" ]]; then
            echo "Erro: executável do desafio não encontrado ou sem permissão de execução: $EXERCICIO_PATH"
            exit 1
        fi
        echo
        echo "Submetendo..."
        cat "$BIN_FILE" | "$EXERCICIO_PATH"
        ;;
    N|NO)
        echo "Submissão cancelada."
        ;;
    *)
        echo "Resposta inválida. Use Y ou N."
        exit 1
        ;;
esac