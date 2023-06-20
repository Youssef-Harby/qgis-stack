.PHONY: up down copy-demo

up:
	docker compose up -d

down:
	docker compose down

copy-demo:
	docker cp -a $(CURDIR)/Sync/. syncthing:/var/syncthing/Sync/
