# Airbrake Deploy Buildkite Plugin [![Build status](https://badge.buildkite.com/ee6b340d59c88537178d0d9489d038aba1a7a2a4e98af1d937.svg)](https://buildkite.com/seedrs/airbrake-deploy-notification-buildkite-plugin)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) for for sending deploy notifications to [Airbrake](https://airbrake.io/).

## Example

```yml
steps:
  - label: ":rocket: Aribrake Deploy"
    plugins:
      - seedrs/airbrake-deploy#v0.0.1:
          environment: production
          project_key: abc123123
          project_id: 1231
    agents:
      queue: my-queue
```

## Options

### `environment`

The environment name

### `project_key` (optional if AIRBRAKE_PROJECT_KEY env var is defined)

Airbrake project key

### `project_id` (optional if AIRBRAKE_PROJECT_ID env var is defined)

Airbrake project id

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```
