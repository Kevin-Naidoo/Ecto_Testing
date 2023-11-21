defmodule Ept.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [

      Ept.PromEx,
      # Start the Telemetry supervisor
      EptWeb.Telemetry,
      # Start the Ecto repository
      Ept.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ept.PubSub},
      # Start Finch
      {Finch, name: Ept.Finch},
      # Start the Endpoint (http/https)
      EptWeb.Endpoint
      # Start a worker by calling: Ept.Worker.start_link(arg)
      # {Ept.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ept.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EptWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
