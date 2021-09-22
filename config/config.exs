# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :demo_phx_auth_and_graphql,
  ecto_repos: [DemoPhxAuthAndGraphql.Repo]

# Configures the endpoint
config :demo_phx_auth_and_graphql, DemoPhxAuthAndGraphqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/LUUThpVVhL9I7xXjTvcFHrBfoj2nxstkyMPfRNWClGT+BsqddlfSBgI69yJ1kN0",
  render_errors: [view: DemoPhxAuthAndGraphqlWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DemoPhxAuthAndGraphql.PubSub,
  live_view: [signing_salt: "l07VUE/C"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
