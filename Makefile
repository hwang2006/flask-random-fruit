install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C,W1203,W0702 app.py tests/

test:
	python -m pytest -vv --cov=app test_app.py

format:
	black *.py

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	rm -rf .pytest_cache
	rm -rf .coverage

run:
	python app.py

freeze:
	pip freeze > requirements.txt

venv:
	python -m venv venv
	source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

all: install lint test format