defmodule ApiEquiposFutbol.JugadoresTest do
  use ApiEquiposFutbol.DataCase

  alias ApiEquiposFutbol.Jugadores

  describe "jugadores" do
    alias ApiEquiposFutbol.Jugadores.Jugador

    import ApiEquiposFutbol.JugadoresFixtures

    @invalid_attrs %{edad: nil, nombre_completo: nil}

    test "list_jugadores/0 returns all jugadores" do
      jugador = jugador_fixture()
      assert Jugadores.list_jugadores() == [jugador]
    end

    test "get_jugador!/1 returns the jugador with given id" do
      jugador = jugador_fixture()
      assert Jugadores.get_jugador!(jugador.id) == jugador
    end

    test "create_jugador/1 with valid data creates a jugador" do
      valid_attrs = %{edad: 42, nombre_completo: "some nombre_completo"}

      assert {:ok, %Jugador{} = jugador} = Jugadores.create_jugador(valid_attrs)
      assert jugador.edad == 42
      assert jugador.nombre_completo == "some nombre_completo"
    end

    test "create_jugador/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jugadores.create_jugador(@invalid_attrs)
    end

    test "update_jugador/2 with valid data updates the jugador" do
      jugador = jugador_fixture()
      update_attrs = %{edad: 43, nombre_completo: "some updated nombre_completo"}

      assert {:ok, %Jugador{} = jugador} = Jugadores.update_jugador(jugador, update_attrs)
      assert jugador.edad == 43
      assert jugador.nombre_completo == "some updated nombre_completo"
    end

    test "update_jugador/2 with invalid data returns error changeset" do
      jugador = jugador_fixture()
      assert {:error, %Ecto.Changeset{}} = Jugadores.update_jugador(jugador, @invalid_attrs)
      assert jugador == Jugadores.get_jugador!(jugador.id)
    end

    test "delete_jugador/1 deletes the jugador" do
      jugador = jugador_fixture()
      assert {:ok, %Jugador{}} = Jugadores.delete_jugador(jugador)
      assert_raise Ecto.NoResultsError, fn -> Jugadores.get_jugador!(jugador.id) end
    end

    test "change_jugador/1 returns a jugador changeset" do
      jugador = jugador_fixture()
      assert %Ecto.Changeset{} = Jugadores.change_jugador(jugador)
    end
  end
end
