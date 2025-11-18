# amplify dbt models

## Description
1. This is the repo to help with the data modeling utilizing `dbt-core` and `snowflake` cloud datawarehouse

**Note:** 
    This is a built for test purpose only and does not include the extensive and comprehensive data models.
    This is based on only the daya provided by the Amplify team.

## dbt CLI Development Setup
**Assumption:**
1. You have already cloned the repo (https://github.com/deep-bkm/amplify) locally
2. You have access to the Snowflake instance, if you need access contact deep.bkm@gmail.com
3. You are on a windows machine, if you are on MacOS, please contact deep.bkm@gmail.com
4. Your profiles.yml is setup correctly. If you need help contact deep.bkm@gmail.com

1. Run  `python -m venv .venv` to create a virtual environment.
2. Run `.venv/Scripts/activate` to activate virtual environment on windows OS.
3. Run `pip install -r requirements.txt` to install all the pre-requisities
4. Run `dbt deps`, `dbt debug` and `dbt compile` to validate all the connections.

