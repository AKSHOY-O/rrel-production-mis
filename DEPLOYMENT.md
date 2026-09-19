# Public deployment

The included Docker Compose stack publishes the MIS through Caddy with automatic HTTPS. The application container remains private and only Caddy exposes ports 80 and 443.

## Requirements

- A Linux server with a public IP address
- Docker Engine with Docker Compose
- A domain or subdomain whose DNS `A`/`AAAA` record points to the server
- Inbound TCP ports 80 and 443, plus UDP 443, allowed by the host firewall

## Deploy

1. Copy the project to the server.
2. Copy `.env.example` to `.env`.
3. Set `MIS_DOMAIN` to the real DNS name and confirm `MIS_TIMEZONE`.
4. Start the stack:

   ```bash
   docker compose up -d --build
   ```

5. Open `https://your-domain.example` and create the first master account.
6. Create normal operator accounts from **Users** after signing in as master.

## Production access rules

- Normal users can view dashboards and reports.
- Normal users can enter or edit only the shift that is active at the server's configured timezone.
- Shift A: 06:00–14:00.
- Shift B: 14:00–22:00.
- Shift C: 22:00–06:00. From midnight to 06:00, its operational date is the previous calendar day.
- Masters can manage every date and shift, accounts, deletions, audit records and backups.
- These rules are enforced by the server; changing browser controls cannot bypass them.

## Backups

Download a consistent backup from **Users → System administration** at least daily. Keep multiple encrypted copies outside the server. The live database is stored in the Docker volume `rrel_data`.

Test restoration on a separate server periodically. Stop the application before manually replacing the database file.

## Updates

```bash
docker compose down
docker compose up -d --build
```

Back up the database before every update. Never commit `.env`, database files or downloaded backups to source control.
