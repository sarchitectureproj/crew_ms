# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :crewService,
  ecto_repos: [CrewService.Repo]

# Configures the endpoint
config :crewService, CrewServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rkMKA/LkiL+TfA028UKFzso08YM9sMj3Wpcgn2mgSJCy9UGykzocyM9Kt7Hj5dMY",
  render_errors: [view: CrewServiceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CrewService.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :paddle, Paddle,
  host: "dnode2.centralus.cloudapp.azure.com",
  base: "dc=disem,dc=unal,dc=edu,dc=co",
  port: 389,
  account_subdn: "ou=crew",
  account_identifier: :cn
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
