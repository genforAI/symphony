defmodule SymphonyElixir.GitHub.SecretEnvironmentNamesTest do
  use ExUnit.Case, async: true

  alias SymphonyElixir.GitHub.Adapter

  test "scrubs standard GitHub authentication environment names" do
    tracker_settings = %{
      kind: "github",
      provider: %{
        "repo" => "octo/repo",
        "token" => "$SYMPHONY_GITHUB_TOKEN"
      },
      active_states: ["open"],
      terminal_states: ["closed"]
    }

    assert Adapter.secret_environment_names(tracker_settings) == [
             "GITHUB_TOKEN",
             "GH_TOKEN",
             "GITHUB_ENTERPRISE_TOKEN",
             "GH_ENTERPRISE_TOKEN",
             "SYMPHONY_GITHUB_TOKEN"
           ]
  end
end
