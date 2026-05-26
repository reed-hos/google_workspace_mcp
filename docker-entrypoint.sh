#!/bin/sh
set -e

CREDS_DIR="${WORKSPACE_MCP_CREDENTIALS_DIR:-/data/store_creds}"

mkdir -p "$CREDS_DIR"
chown -R app:app "$CREDS_DIR"
chmod 700 "$CREDS_DIR"

exec su app -c 'uv run main.py --transport streamable-http ${TOOL_TIER:+--tool-tier "$TOOL_TIER"} ${TOOLS:+--tools $TOOLS}'
