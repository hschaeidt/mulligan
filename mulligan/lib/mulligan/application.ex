defmodule Mulligan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MulliganWeb.Telemetry,
      # Start the Ecto repository
      Mulligan.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mulligan.PubSub},
      # Start Finch
      {Finch, name: Mulligan.Finch},
      # Start the Endpoint (http/https)
      MulliganWeb.Endpoint
      # Start a worker by calling: Mulligan.Worker.start_link(arg)
      # {Mulligan.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mulligan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MulliganWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
