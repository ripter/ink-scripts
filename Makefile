.PHONY: all server
NPM_BIN=./node_modules/.bin

all: server


server: node_modules/
	$(NPM_BIN)/http-server

node_modules/: package.json
	npm install
	touch node_modules/

deploy.webfaction:
	scp -r public/* ripter001@web626.webfaction.com:/home/ripter001/webapps/static/ink_scripts/
