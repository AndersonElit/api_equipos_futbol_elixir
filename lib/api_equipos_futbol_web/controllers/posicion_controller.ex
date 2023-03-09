defmodule ApiEquiposFutbolWeb.PosicionController do
  use ApiEquiposFutbolWeb, :controller

  alias ApiEquiposFutbol.Posiciones
  alias ApiEquiposFutbol.Posiciones.Posicion

  action_fallback ApiEquiposFutbolWeb.FallbackController

  def index(conn, _params) do
    posiciones = Posiciones.list_posiciones()
    render(conn, :index, posiciones: posiciones)
  end

  def create(conn, %{"posicion" => posicion_params}) do
    with {:ok, %Posicion{} = posicion} <- Posiciones.create_posicion(posicion_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/posiciones/#{posicion}")
      |> render(:show, posicion: posicion)
    end
  end

  def show(conn, %{"id" => id}) do
    posicion = Posiciones.get_posicion!(id)
    render(conn, :show, posicion: posicion)
  end

  def update(conn, %{"id" => id, "posicion" => posicion_params}) do
    posicion = Posiciones.get_posicion!(id)

    with {:ok, %Posicion{} = posicion} <- Posiciones.update_posicion(posicion, posicion_params) do
      render(conn, :show, posicion: posicion)
    end
  end

  def delete(conn, %{"id" => id}) do
    posicion = Posiciones.get_posicion!(id)

    with {:ok, %Posicion{}} <- Posiciones.delete_posicion(posicion) do
      send_resp(conn, :no_content, "")
    end
  end
end
