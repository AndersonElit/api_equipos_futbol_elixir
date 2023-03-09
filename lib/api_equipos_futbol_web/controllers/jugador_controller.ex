defmodule ApiEquiposFutbolWeb.JugadorController do
  use ApiEquiposFutbolWeb, :controller

  alias ApiEquiposFutbol.Jugadores
  alias ApiEquiposFutbol.Jugadores.Jugador

  action_fallback ApiEquiposFutbolWeb.FallbackController

  def index(conn, _params) do
    jugadores = Jugadores.list_jugadores()
    render(conn, :index, jugadores: jugadores)
  end

  def create(conn, %{"jugador" => jugador_params}) do
    with {:ok, %Jugador{} = jugador} <- Jugadores.create_jugador(jugador_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/jugadores/#{jugador}")
      |> render(:show, jugador: jugador)
    end
  end

  def show(conn, %{"id" => id}) do
    jugador = Jugadores.get_jugador!(id)
    render(conn, :show, jugador: jugador)
  end

  def update(conn, %{"id" => id, "jugador" => jugador_params}) do
    jugador = Jugadores.get_jugador!(id)

    with {:ok, %Jugador{} = jugador} <- Jugadores.update_jugador(jugador, jugador_params) do
      render(conn, :show, jugador: jugador)
    end
  end

  def delete(conn, %{"id" => id}) do
    jugador = Jugadores.get_jugador!(id)

    with {:ok, %Jugador{}} <- Jugadores.delete_jugador(jugador) do
      send_resp(conn, :no_content, "")
    end
  end
end
