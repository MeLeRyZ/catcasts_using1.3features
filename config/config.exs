# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :catcasts,
  ecto_repos: [Catcasts.Repo]

# Configures the endpoint
config :catcasts, CatcastsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YQJr9TdB0I/FgWVtF0geQt58W++oRw+NnwpG/Ga1jc8s5yyGZoRJGyx6xWEXxJ2N",
  render_errors: [view: CatcastsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catcasts.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  # Configure Rummage Phoenix
  config :rummage_ecto, Rummage.Ecto,
    default_repo: Catcasts.Repo,
    default_per_page: 5
  # Configure Google OAuth
  config :ueberauth, Ueberauth,
    providers: [
      google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
    ]
  config :ueberauth, Ueberauth.Strategy.Google.OAuth,
    client_id: System.get_env("GOOGLE_CLIENT_ID"),
    client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
