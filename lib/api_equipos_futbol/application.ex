defmodule ApiEquiposFutbol.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ApiEquiposFutbolWeb.Telemetry,
      # Start the Ecto repository
      ApiEquiposFutbol.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ApiEquiposFutbol.PubSub},
      # Start Finch
      {Finch, name: ApiEquiposFutbol.Finch},
      # Start the Endpoint (http/https)
      ApiEquiposFutbolWeb.Endpoint
      # Start a worker by calling: ApiEquiposFutbol.Worker.start_link(arg)
      # {ApiEquiposFutbol.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiEquiposFutbol.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApiEquiposFutbolWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
