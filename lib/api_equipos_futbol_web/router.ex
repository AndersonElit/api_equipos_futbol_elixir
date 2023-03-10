defmodule ApiEquiposFutbolWeb.Router do
  use ApiEquiposFutbolWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ApiEquiposFutbolWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ApiEquiposFutbolWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  scope "/api", ApiEquiposFutbolWeb do
    pipe_through :api
    resources "/posiciones", PosicionController, except: [:new, :edit]
    resources "/equipos", EquipoController, except: [:new, :edit]
    resources "/jugadores", JugadorController, except: [:new, :edit]
    put "/jugadores/transferir/:jugador_id", JugadorController, :transferir
    get "/jugadores/jugadores-equipo/:id_equipo", JugadorController, :jugadoresEquipo
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:api_equipos_futbol, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ApiEquiposFutbolWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
