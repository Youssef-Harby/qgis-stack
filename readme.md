# QGIS Stack

This repository contains the Docker Compose file and configuration for setting up a QGIS Stack. It includes services for PostgreSQL with PostGIS, Syncthing, PgAdmin, and Caddy.

## Requirements

- Docker and Docker Compose [How to install for Linux and macOS and Windows](https://docs.docker.com/engine/install/)
- Make (`sudo apt install make`) for **_linux_**
- if you are windows you can run it with run.bat file

## Configuration

The project uses the following environment variables, which are set in the `.env` file:

- `COMPOSE_PROJECT_NAME=qgis`
- `POSTGIS_VERSION_TAG=15-3.3`
- `POSTGRES_PORT=5432`
- `POSTGRES_USER=postgres`
- `POSTGRES_PASSWORD=grafica`
- `ALLOW_IP_RANGE=0.0.0.0/0`
- `PGADMIN_VERSION_TAG=7.0`
- `PGADMIN_PORT=8085`
- `PGADMIN_DEFAULT_EMAIL=gmioannou@gmail.com`
- `PGADMIN_DEFAULT_PASSWORD=grafica`

## Usage

## Changing Domain Name and Using Let's Encrypt Staging

By default, the provided configuration in this repository uses placeholder domain names. To change the domain names and use Let's Encrypt staging for the staging environment, follow the steps below:

1. Configure the DNS settings for your domain names:

   - If you already own the domain names you specified in the Caddyfile, make sure to set up A records pointing to the IP address of the server where you will be hosting your services. You can usually do this through your domain registrar's control panel or DNS management interface.

   - If you are testing locally or in a development environment, you can modify your local hosts file (`/etc/hosts` on Unix-like systems or `C:\Windows\System32\drivers\etc\hosts` on Windows) to map the domain names to the IP address of your local machine.

2. Open the `./caddy/Caddyfile` in a text editor.

**Proper DNS configuration is essential to ensure that the domain names resolve to the correct IP address when accessed from a web browser.**

3. Replace all occurrences of `example.com` with your desired domain name for each service. For example, replace `syncthing.example.com`, `pgadmin4.example.com`, and `api.example.com` with the respective domain names you want to use.

4. To use Let's Encrypt staging for the staging environment, add the following line at the top of your `Caddyfile` or remove it in production:

   ```plaintext
   {
       acme_ca https://acme-staging-v02.api.letsencrypt.org/directory
   }
   ```

5. The `Makefile` provides commands for interacting with the stack:

- `make up`: Starts the stack using Docker Compose.
- `make copy-demo`: Copies the content of the `Sync` directory to the `syncthing` service.
- `make down`: Stops the stack using Docker Compose.

1. Any new edits on `Caddyfile` you will need to restart the Caddy server (container) to apply the new configuration.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss your proposed changes.

## License

This project is open source and available under the [MIT License](LICENSE).
