clean::
	rm -rf venv
	rm -rf node_modules
	rm -f keys/*

venv::
	python -m venv venv

pip::
	pip install -U pip
	pip install -r requirements.txt

npm::
	npm clean-install

keys::
	rm -f keys/*
	bash bin/key-gen.sh

bootstrap::
	$(MAKE) clean
	$(MAKE) npm
	$(MAKE) venv
	$(MAKE) keys
	. venv/bin/activate && $(MAKE) pip
	echo ' run . venv/bin/activate'

