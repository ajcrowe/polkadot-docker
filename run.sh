#!/bin/bash

# Build Flags
flags=( 
	'ENABLE_DEV,--dev'
	'ENABLE_LIGHTCLIENT,--light'
	'NO_TELEMETRY,--no-telelmetry'
	'TELEMETRY,--telemetry'
	'VALIDATOR,--validator'
	'RPC_EXTERNAL,--rcp-external'
	'WS_EXTERNAL,--ws-external'
)

for v in ${flags[@]}; do
	env=$(echo $v | cut -d',' -f1)
	flag=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params ${flag}"
done

options=(
	'BASE_PATH,--base-path'
	'BOOTNODES,--bootnodes'
	'CHAIN,--chain'
	'EXECUTION,--execution'
	'KEY,--key'
	'KEYSTORE_PATH,--keystore-path'
	'LOG,--log'
	'MAX_HEAP_PAGES,--max-heap-pages'
	'MIN_HEAP_PAGES,--min-heap-pages'
	'NAME,--name'
	'NODE_KEY,--node-key'
	'PORT,--port'
	'PRUNING,--pruning'
	'RESERVED_NODES,--reserved-nodes'
	'RPC_PORT,--rpc-port'
	'WS_PORT,--ws-port'
	'TELEMETRY_URL,--telemetry-url'
)

for v in ${options[@]}; do
	env=$(echo $v | cut -d',' -f1)
	flag=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params $flag ${!env}"
done

/usr/local/bin/polkadot $params $@
