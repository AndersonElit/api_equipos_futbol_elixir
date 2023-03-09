defmodule ApiEquiposFutbol.PosicionesTest do
  use ApiEquiposFutbol.DataCase

  alias ApiEquiposFutbol.Posiciones

  describe "posiciones" do
    alias ApiEquiposFutbol.Posiciones.Posicion

    import ApiEquiposFutbol.PosicionesFixtures

    @invalid_attrs %{abreviatura: nil, nombre: nil}

    test "list_posiciones/0 returns all posiciones" do
      posicion = posicion_fixture()
      assert Posiciones.list_posiciones() == [posicion]
    end

    test "get_posicion!/1 returns the posicion with given id" do
      posicion = posicion_fixture()
      assert Posiciones.get_posicion!(posicion.id) == posicion
    end

    test "create_posicion/1 with valid data creates a posicion" do
      valid_attrs = %{abreviatura: "some abreviatura", nombre: "some nombre"}

      assert {:ok, %Posicion{} = posicion} = Posiciones.create_posicion(valid_attrs)
      assert posicion.abreviatura == "some abreviatura"
      assert posicion.nombre == "some nombre"
    end

    test "create_posicion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posiciones.create_posicion(@invalid_attrs)
    end

    test "update_posicion/2 with valid data updates the posicion" do
      posicion = posicion_fixture()
      update_attrs = %{abreviatura: "some updated abreviatura", nombre: "some updated nombre"}

      assert {:ok, %Posicion{} = posicion} = Posiciones.update_posicion(posicion, update_attrs)
      assert posicion.abreviatura == "some updated abreviatura"
      assert posicion.nombre == "some updated nombre"
    end

    test "update_posicion/2 with invalid data returns error changeset" do
      posicion = posicion_fixture()
      assert {:error, %Ecto.Changeset{}} = Posiciones.update_posicion(posicion, @invalid_attrs)
      assert posicion == Posiciones.get_posicion!(posicion.id)
    end

    test "delete_posicion/1 deletes the posicion" do
      posicion = posicion_fixture()
      assert {:ok, %Posicion{}} = Posiciones.delete_posicion(posicion)
      assert_raise Ecto.NoResultsError, fn -> Posiciones.get_posicion!(posicion.id) end
    end

    test "change_posicion/1 returns a posicion changeset" do
      posicion = posicion_fixture()
      assert %Ecto.Changeset{} = Posiciones.change_posicion(posicion)
    end
  end
end
