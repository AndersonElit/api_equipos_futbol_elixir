defmodule ApiEquiposFutbolWeb.EquipoControllerTest do
  use ApiEquiposFutbolWeb.ConnCase

  import ApiEquiposFutbol.EquiposFixtures

  alias ApiEquiposFutbol.Equipos.Equipo

  @create_attrs %{
    abreviatura: "some abreviatura",
    nombre: "some nombre"
  }
  @update_attrs %{
    abreviatura: "some updated abreviatura",
    nombre: "some updated nombre"
  }
  @invalid_attrs %{abreviatura: nil, nombre: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all equipos", %{conn: conn} do
      conn = get(conn, ~p"/api/equipos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create equipo" do
    test "renders equipo when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/equipos", equipo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/equipos/#{id}")

      assert %{
               "id" => ^id,
               "abreviatura" => "some abreviatura",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/equipos", equipo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update equipo" do
    setup [:create_equipo]

    test "renders equipo when data is valid", %{conn: conn, equipo: %Equipo{id: id} = equipo} do
      conn = put(conn, ~p"/api/equipos/#{equipo}", equipo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/equipos/#{id}")

      assert %{
               "id" => ^id,
               "abreviatura" => "some updated abreviatura",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, equipo: equipo} do
      conn = put(conn, ~p"/api/equipos/#{equipo}", equipo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete equipo" do
    setup [:create_equipo]

    test "deletes chosen equipo", %{conn: conn, equipo: equipo} do
      conn = delete(conn, ~p"/api/equipos/#{equipo}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/equipos/#{equipo}")
      end
    end
  end

  defp create_equipo(_) do
    equipo = equipo_fixture()
    %{equipo: equipo}
  end
end
