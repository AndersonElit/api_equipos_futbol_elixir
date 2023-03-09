defmodule ApiEquiposFutbol.EquiposTest do
  use ApiEquiposFutbol.DataCase

  alias ApiEquiposFutbol.Equipos

  describe "equipos" do
    alias ApiEquiposFutbol.Equipos.Equipo

    import ApiEquiposFutbol.EquiposFixtures

    @invalid_attrs %{abreviatura: nil, nombre: nil}

    test "list_equipos/0 returns all equipos" do
      equipo = equipo_fixture()
      assert Equipos.list_equipos() == [equipo]
    end

    test "get_equipo!/1 returns the equipo with given id" do
      equipo = equipo_fixture()
      assert Equipos.get_equipo!(equipo.id) == equipo
    end

    test "create_equipo/1 with valid data creates a equipo" do
      valid_attrs = %{abreviatura: "some abreviatura", nombre: "some nombre"}

      assert {:ok, %Equipo{} = equipo} = Equipos.create_equipo(valid_attrs)
      assert equipo.abreviatura == "some abreviatura"
      assert equipo.nombre == "some nombre"
    end

    test "create_equipo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipos.create_equipo(@invalid_attrs)
    end

    test "update_equipo/2 with valid data updates the equipo" do
      equipo = equipo_fixture()
      update_attrs = %{abreviatura: "some updated abreviatura", nombre: "some updated nombre"}

      assert {:ok, %Equipo{} = equipo} = Equipos.update_equipo(equipo, update_attrs)
      assert equipo.abreviatura == "some updated abreviatura"
      assert equipo.nombre == "some updated nombre"
    end

    test "update_equipo/2 with invalid data returns error changeset" do
      equipo = equipo_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipos.update_equipo(equipo, @invalid_attrs)
      assert equipo == Equipos.get_equipo!(equipo.id)
    end

    test "delete_equipo/1 deletes the equipo" do
      equipo = equipo_fixture()
      assert {:ok, %Equipo{}} = Equipos.delete_equipo(equipo)
      assert_raise Ecto.NoResultsError, fn -> Equipos.get_equipo!(equipo.id) end
    end

    test "change_equipo/1 returns a equipo changeset" do
      equipo = equipo_fixture()
      assert %Ecto.Changeset{} = Equipos.change_equipo(equipo)
    end
  end
end
