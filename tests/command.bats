#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

# Uncomment to enable stub debug output:
# export CURL_STUB_DEBUG=/dev/tty

@test "Send a deploy tracking notification" {
  export BUILDKITE_COMMIT="ffc9539774db41596ee11a00b38ed42dcaa058c6"
  export BUILDKITE_BUILD_CREATOR="John Doe"
  export BUILDKITE_BUILD_CREATOR_EMAIL="john.doe@email.com"
  export BUILDKITE_REPO="git@github.com:Seedrs/airbrake-deploy-buildkite-plugin.git"
  export BUILDKITE_PLUGIN_AIRBRAKE_DEPLOY_ENVIRONMENT="production"
  export BUILDKITE_PLUGIN_AIRBRAKE_DEPLOY_PROJECT_ID="123123"
  export BUILDKITE_PLUGIN_AIRBRAKE_DEPLOY_PROJECT_KEY="abc123"

  stub curl "--silent -X POST -H 'Content-Type: application/json' -d '{\"environment\": \"production\", \"username\": \"John Doe\", \"email\": \"john.doe@email.com\", \"repository\": \"git@github.com:Seedrs/airbrake-deploy-buildkite-plugin.git\", \"revision\": \"ffc9539\"}' https://api.airbrake.io/api/v4/projects/123123/deploys?key=abc123 : echo 'ok'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "ok"
  unstub curl
}
