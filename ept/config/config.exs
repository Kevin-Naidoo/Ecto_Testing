#
import Config

config :ept,
  ecto_repos: [Ept.Repo]

  config :ept, Ept.PromEx,
  manual_metrics_start_delay: :no_delay,
  drop_metrics_groups: [],
  grafana: [
    host: System.get_env("GRAFANA_HOST", "http://localhost:3000"),
    auth_token: "glsa_mKrZEJ1FTSGRkO2NWdWvOSJHRn4LFxpz_f385af3c",
    upload_dashboard_on_start: true,
    folder_name: "ecto_dashboard",
    annotate_app_lifecycle: true
  ]
# Configures the endpoint
config :ept, EptWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: EptWeb.ErrorHTML, json: EptWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Ept.PubSub,
  live_view: [signing_salt: "TboXdnK4"]

# Configures the mailer
#

config :ept, Ept.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
