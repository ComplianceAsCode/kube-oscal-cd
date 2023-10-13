# Makefile

SOURCE = /tmp/venv.kube-cd

all: venv trestle-init kube-cd

#####

venv:
	echo "=> venv"
	if [ ! -d $(SOURCE) ]; then \
		echo "=> create python virtual environment"; \
		python -m venv $(SOURCE); \
		source $(SOURCE)/bin/activate; \
		echo "=> install prereqs"; \
		python -m pip install -q --upgrade pip setuptools; \
		python -m pip install -q git+https://github.com/IBM/compliance-trestle.git@develop; \
	fi

trestle-init:
	echo "=> trestle-init"
	source $(SOURCE)/bin/activate; \
	trestle init

kube-cd:
	echo "=> kube-cd"
	source $(SOURCE)/bin/activate; \
	trestle task csv-to-oscal-cd -c data/csv-to-oscal-cd.config

help:
	echo "=> cd-csv-to-json"
	source $(SOURCE)/bin/activate; \
	trestle task -l

help-info:
	echo "=> cd-csv-to-json"
	source $(SOURCE)/bin/activate; \
	trestle task csv-to-oscal-cd -i -c data/csv-to-oscal-cd.config

clean:
	echo "=> clean"
	rm -fr $(SOURCE)