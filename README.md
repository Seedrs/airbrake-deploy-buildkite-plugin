# Airbrake Deploy Buildkite Plugin [![Build status]()](https://buildkite.com/seedrs/airbrake-deploy-buildkite-plugin)

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

### `project_key`

Airbrake project key

### `project_id`

Airbrake project id

## Developing

To run the tests:

```bash
docker-compose run --rm tests
```