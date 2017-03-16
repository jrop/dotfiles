#!/usr/bin/env zsh

export PATH=./node_modules/.bin:$PATH

_is-tunnel() {
	if [ $# -ne 3 ]; then
		echo "Usage: _is-tunnel [local-port] [host] [port]"
		return
	fi

	localPort=$1
	host=$2
	port=$3
	echo Local-port: $localPort
	ssh kebler.is.colostate.edu -L $localPort:$host:$port
}
registry-laplata-tunnel() {
	npm set registry http://localhost:8081/nexus/content/groups/npm-all/
	_is-tunnel 8081 laplata.is.colostate.edu 8081
}
registry-laplata() {
	npm set registry http://laplata.is.colostate.edu:8081/nexus/content/repositories/npm-all/
}
registry() {
	npm set registry https://registry.npmjs.org/
}

