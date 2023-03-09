defmodule ApiEquiposFutbolWeb.JugadorControllerTest do
  use ApiEquiposFutbolWeb.ConnCase

  import ApiEquiposFutbol.JugadoresFixtures

  alias ApiEquiposFutbol.Jugadores.Jugador

  @create_attrs %{
    edad: 42,
    nombre_completo: "some nombre_completo"
  }
  @update_attrs %{
    edad: 43,
    nombre_completo: "some updated nombre_completo"
  }
  @invalid_attrs %{edad: nil, nombre_completo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all jugadores", %{conn: conn} do
      conn = get(conn, ~p"/api/jugadores")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create jugador" do
    test "renders jugador when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/jugadores", jugador: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/jugadores/#{id}")

      assert %{
               "id" => ^id,
               "edad" => 42,
               "nombre_completo" => "some nombre_completo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/jugadores", jugador: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update jugador" do
    setup [:create_jugador]

    test "renders jugador when data is valid", %{conn: conn, jugador: %Jugador{id: id} = jugador} do
      conn = put(conn, ~p"/api/jugadores/#{jugador}", jugador: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/jugadores/#{id}")

      assert %{
               "id" => ^id,
               "edad" => 43,
               "nombre_completo" => "some updated nombre_completo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, jugador: jugador} do
      conn = put(conn, ~p"/api/jugadores/#{jugador}", jugador: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete jugador" do
    setup [:create_jugador]

    test "deletes chosen jugador", %{conn: conn, jugador: jugador} do
      conn = delete(conn, ~p"/api/jugadores/#{jugador}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/jugadores/#{jugador}")
      end
    end
  end

  defp create_jugador(_) do
    jugador = jugador_fixture()
    %{jugador: jugador}
  end
end
