SHELL = /bin/bash

.PHONY: install run

install:
	@echo "Descargando Sculpin..."
	@curl -O https://download.sculpin.io/sculpin.phar
	@echo "Configurando Sculpin..."
	@mkdir bin
	@mv sculpin.phar bin/sculpin
	@chmod u+x bin/sculpin
	@echo "Instalando sitio Web..."
	@php bin/sculpin install
	@mkdir output_dev
	@cp -r .sculpin/components output_dev/

run:
	@php bin/sculpin generate --watch --server
