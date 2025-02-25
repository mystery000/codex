#!/usr/bin/env bash

export CURRENT_DIR=$(dirname $(realpath $0))
source $CURRENT_DIR/vars.sh

if [ -z "$1" ]; then
    echo "[CODEX_CLI][SETPASS]: No codex user defined!"
    exit 1
fi

if [ -z "$2" ]; then
    echo "[CODEX_CLI][SETPASS]: No password!"
    exit 1
fi

echo "[CODEX_CLI][PASSETPASSS]: Hash password..."
HASH="$(echo -n "$2" | sha256sum | cut -d' ' -f1)"

echo "[CODEX_CLI][SETPASS]: Set password hash..."
$CURRENT_DIR/passhash.sh $1 "$HASH"

echo "[CODEX_CLI][SETPASS]: Password set!"
