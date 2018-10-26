.PHONY: all server
NPM_BIN=./node_modules/.bin

all: server


server: node_modules/
	$(NPM_BIN)/http-server

node_modules/: package.json
	npm install
	touch node_modules/
