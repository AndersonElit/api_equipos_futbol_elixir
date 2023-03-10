defmodule ApiEquiposFutbolWeb.EquipoController do
  use ApiEquiposFutbolWeb, :controller

  alias ApiEquiposFutbol.Equipos
  alias ApiEquiposFutbol.Equipos.Equipo

  action_fallback ApiEquiposFutbolWeb.FallbackController

  def index(conn, _params) do
    equipos = Equipos.list_equipos()
    render(conn, :index, equipos: equipos)
  end

  def create(conn, %{"equipo" => equipo_params}) do
    with {:ok, %Equipo{} = equipo} <- Equipos.create_equipo(equipo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/equipos/#{equipo}")
      |> render(:show, equipo: equipo)
    end
  end

  def show(conn, %{"id" => id}) do
    equipo = Equipos.get_equipo!(id)
    render(conn, :show, equipo: equipo)
  end

  def update(conn, %{"id" => id, "equipo" => equipo_params}) do
    equipo = Equipos.get_equipo!(id)

    with {:ok, %Equipo{} = equipo} <- Equipos.update_equipo(equipo, equipo_params) do
      render(conn, :show, equipo: equipo)
    end
  end

  def delete(conn, %{"id" => id}) do
    equipo = Equipos.get_equipo!(id)

    with {:ok, %Equipo{}} <- Equipos.delete_equipo(equipo) do
      send_resp(conn, :no_content, "")
    end
  end

end
