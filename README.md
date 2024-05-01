# kube-oscal-cd
Kube OSCAL component definition

### overview

This repo comprises the Kubernetes & Kyverno component definition specified as a compliance-[trestle](https://github.com/IBM/compliance-trestle) standard [component-definition-kube.csv](data/component-definition-kube.csv) file.

To create the OSCAL [component-definition.json](component-definitions/kube/component-definition.json) file from the component-definition-kube.csv file, download this repo then run `make`. 
See console shown below.

The resolved profile used is [NIST_SP-800-53_rev5_HIGH](catalogs/NIST_SP-800-53_rev5_HIGH/NIST_SP-800-53_rev5_HIGH-baseline-resolved-profile_catalog.json).

### console

```
make
echo "=> venv"
=> venv
if [ ! -d /tmp/venv.kube-cd ]; then \
	echo "=> create python virtual environment"; \
	python -m venv /tmp/venv.kube-cd; \
	source /tmp/venv.kube-cd/bin/activate; \
	echo "=> install prereqs"; \
	python -m pip install -q --upgrade pip setuptools; \
	python -m pip install -q git+https://github.com/IBM/compliance-trestle.git@develop; \
fi
=> create python virtual environment
=> install prereqs
echo "=> trestle-init"
=> trestle-init
source /tmp/venv.kube-cd/bin/activate; \
trestle init
Initialized trestle project successfully in /home/degenaro/git/X
echo "=> kube-cd"
=> kube-cd
source /tmp/venv.kube-cd/bin/activate; \
trestle task csv-to-oscal-cd -c data/csv-to-oscal-cd.config
input: data/component-definition-kube.csv
output: component-definitions/kube/component-definition.json
Task: csv-to-oscal-cd executed successfully.
```
