# RREL Production MIS

Professional production management system for shift-wise target and achievement tracking across SMT, DIP/MI and FATP.

**Live website:** https://rrel-production-mis-akshoy.rashmi-metal-0313.chatgpt.site

## Features

- Shift-wise production sheets, dashboards, weekly views and summaries
- CSV export, print-ready reports and professional output design
- Master and normal-user roles enforced by the server
- Normal users can edit only the currently active shift and operational date
- SQLite persistence, PBKDF2 password hashing and secure session cookies
- Audit history, account administration and database backups
- Responsive layout, dark mode and database health monitoring

## Run locally

Requires Python 3.11 or newer.

```powershell
python server.py
```

Open http://127.0.0.1:8765 and create the first master account. On Windows you can also run `start.ps1` to make the site available on the local network.

## Data safety

Operational data is stored in `data/mis.db`. The `data/` directory, environment files and database backups are excluded from Git. Never commit production data or passwords.

## Public deployment

GitHub Pages cannot run this Python/SQLite application. Use the live link above or deploy the included Docker configuration to a server with persistent storage. See `DEPLOYMENT.md` for details.
