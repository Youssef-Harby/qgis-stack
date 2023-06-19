.PHONY: up copy-demo

up:
	docker-compose up -d

copy-demo:
	docker cp -a $(CURDIR)/Sync/. syncthing:/var/syncthing/Sync/

