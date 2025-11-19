# amplify — dbt models

## Description

This repository contains example dbt models and supporting files used to demonstrate data modeling with `dbt-core` and the Snowflake cloud data warehouse. The project is a compact, test-oriented set of models based on data provided by the Amplify team and is not a full production-grade model set.

### Note

This repo is intended for learning and testing only — it does not include comprehensive production models or credentials for Snowflake.

### Assumptions

- You have cloned the repo: `https://github.com/deep-bkm/amplify`.
- You have access to a Snowflake account (contact `deep.bkm@gmail.com` for access questions).
- You have a working `profiles.yml` for dbt configured with your Snowflake connection (see `~/.dbt/profiles.yml` on macOS/Linux or `%USERPROFILE%\.dbt\profiles.yml` on Windows).

## Quickstart — dbt CLI (Windows and macOS/Linux)

1. Create a Python virtual environment:

```powershell
python -m venv .venv
```

2. Activate the virtual environment:

- PowerShell (recommended on Windows):

```powershell
.\.venv\Scripts\Activate.ps1
```

- Command Prompt (Windows):

```cmd
.venv\Scripts\activate.bat
```

- macOS / Linux:

```bash
source .venv/bin/activate
```

3. Install Python dependencies:

```powershell
pip install -r requirements.txt
```

4. Install dbt packages, validate profile, and compile:

```powershell
dbt deps
dbt debug
dbt compile
```

5. Run models and tests (examples):

```powershell
dbt run
dbt test
```

6. Generate and view documentation locally:

```powershell
dbt docs generate
dbt docs serve
```

## Common dbt commands

- `dbt deps` — install packages listed in `packages.yml` (this repo includes `dbt_utils` under `dbt_packages/`).
- `dbt debug` — check profile and connection.
- `dbt compile` — compile models without running them.
- `dbt run` — execute models.
- `dbt test` — run tests.
- `dbt docs generate` / `dbt docs serve` — generate and serve docs.

## Project layout (top-level)

- `models/` — dbt models; contains `staging/`, `intermediate/`, `mart/`, and `core_wh/` folders.
- `macros/` — project macros used by models.
- `seeds/` — CSV/JSON seed data (e.g., `amplify_product.json`).
- `dbt_packages/` — vendored dbt packages (e.g., `dbt_utils`).
- `logs/`, `target/` — dbt runtime artifacts and compiled outputs.
- `dbt_project.yml` — dbt project configuration.
- `profiles.yml` (not included) — user's dbt profile (credentials/config for Snowflake).

## Notes & Contact

- Snowflake credentials are not included in this repo. If you need access or help configuring `profiles.yml`, contact `deep.bkm@gmail.com`.
- If you're on macOS and need platform-specific help, email `deep.bkm@gmail.com`.
