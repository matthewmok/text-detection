.PHONY: build keras stop

build:
	@echo "Building image:"
	docker-compose build

keras:
	@echo "Bringing Docker up in dev mode:"
	docker-compose -f docker-compose.yml up

stop:
	@echo "Bringing Docker down:"
	docker-compose down
