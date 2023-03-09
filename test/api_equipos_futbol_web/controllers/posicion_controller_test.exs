defmodule ApiEquiposFutbolWeb.PosicionControllerTest do
  use ApiEquiposFutbolWeb.ConnCase

  import ApiEquiposFutbol.PosicionesFixtures

  alias ApiEquiposFutbol.Posiciones.Posicion

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
    test "lists all posiciones", %{conn: conn} do
      conn = get(conn, ~p"/api/posiciones")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create posicion" do
    test "renders posicion when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/posiciones", posicion: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/posiciones/#{id}")

      assert %{
               "id" => ^id,
               "abreviatura" => "some abreviatura",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/posiciones", posicion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update posicion" do
    setup [:create_posicion]

    test "renders posicion when data is valid", %{conn: conn, posicion: %Posicion{id: id} = posicion} do
      conn = put(conn, ~p"/api/posiciones/#{posicion}", posicion: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/posiciones/#{id}")

      assert %{
               "id" => ^id,
               "abreviatura" => "some updated abreviatura",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, posicion: posicion} do
      conn = put(conn, ~p"/api/posiciones/#{posicion}", posicion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete posicion" do
    setup [:create_posicion]

    test "deletes chosen posicion", %{conn: conn, posicion: posicion} do
      conn = delete(conn, ~p"/api/posiciones/#{posicion}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/posiciones/#{posicion}")
      end
    end
  end

  defp create_posicion(_) do
    posicion = posicion_fixture()
    %{posicion: posicion}
  end
end
