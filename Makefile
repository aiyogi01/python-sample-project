PACKAGE_NAME  = sample_project

.PHONY        = setup jupyter analyse lint test run-tests
.DEFAULT_GOAL = help

# Scan the Makefile for pairs of lines: a line staring with ##
# is output as command description and the command contained
# in the following line is output as command name.
help: Makefile
	@echo
	@echo " Choose a command run in "\'$(shell basename "$(PWD)")\'":"
	@echo
	@sed -E 'N; s/^##+\s*(.*)\n(.*):.*/ \2:\1/p ;D' $< \
		| column -t -s ':' | sed -e 's/^/ /'
	@echo

## Setup the project
setup:
	@poetry install

## Open Jupyter notebooks
jupyter:
	@poetry run jupyter notebook

## Run static code analysis
analyse:
	@echo "************************************************************"
	poetry run pytype ${PACKAGE_NAME}

## Run linter
lint:
	@echo "************************************************************"
	poetry run pylint ${PACKAGE_NAME}

## Run tests with coverage
test:
	@echo "************************************************************"
	poetry run pytest --cov ${PACKAGE_NAME} --cov-report html --cov-report term

## Run all checks and tests
run-tests: analyse lint test
