PACKAGE_NAME  = sample_project

.PHONY        = help setup jupyter analyse lint test all-tests
.DEFAULT_GOAL = help

# Scan this Makefile and print a summary of the available commands.
#
# A little Sed script searches for pairs of lines: a line staring with ##
# is printed as a command description and the command contained
# in the following line is printed as a command name.
help: Makefile
	@echo
	@echo " Choose a command run in "\'$(shell basename "$(PWD)")\'":"
	@echo
	@sed -E 'N; s/^##+\s*(.*)\n(.*):.*/ \2:\1/p ;D' $< \
		| column -t -s ':' | sed -e 's/^/ /'
	@echo

## Setup the project for local development
setup:
	pyenv install --skip-existing 3.8.1
	pyenv local 3.8.1
	poetry install

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
all-tests: analyse lint test
