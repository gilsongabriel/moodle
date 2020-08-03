down:
	docker-compose down

up: down
	docker-compose up -d --build

ps:
	docker ps -la

img:
	docker images -la