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

**NOTE**: Any new edits on `Caddyfile` you will need to restart the Caddy server (container) to apply the new configuration.

# Syncthing Configuration

This tutorial guides you through setting up Syncthing to synchronize files between two devices, referred to as the "local device" and the "remote device." It's recommended to install and configure Syncthing on both devices simultaneously, but it's okay if you can't access both at the same time.

### Setting Up Folders

1. Syncthing sets up a folder called `Default Folder` in a directory named `Sync` in your home directory upon the first start.
2. The admin GUI is available at `https://syncthing.example.com/`. On the left is a list of folders (directories to synchronize), and on the right is a list of devices. The `Default Folder` is marked as "Unshared" initially because it's not shared with any other device.

![Admin GUI](https://docs.syncthing.net/_images/gs1.png)

### Adding Remote Devices

1. To synchronize files with another device, exchange "device IDs." A device ID is a unique identifier generated when you first start Syncthing. Find it in the web GUI under "Actions" > "Show ID".

![Device ID](https://docs.syncthing.net/_images/gs2.png)

2. Click "Add Remote Device" and enter the other device's ID. Also, select the folder(s) you want to share. The device name is optional.

![Adding Remote Device](https://docs.syncthing.net/_images/gs3.png)

3. After clicking "Save," the new device will appear on the right side of the GUI. It will connect within a minute or so. Now, adding files to the shared directory on either device will synchronize those files to the other side.

![Connected Devices](https://docs.syncthing.net/_images/gs5.png)

## Support and Contributions

For additional support, refer to the [Community Contributions](https://syncthing.net/contributions/) page.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss your proposed changes.

## License

This project is open source and available under the [MIT License](LICENSE).
