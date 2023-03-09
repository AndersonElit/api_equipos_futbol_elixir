defmodule ApiEquiposFutbol.EquiposFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiEquiposFutbol.Equipos` context.
  """

  @doc """
  Generate a equipo.
  """
  def equipo_fixture(attrs \\ %{}) do
    {:ok, equipo} =
      attrs
      |> Enum.into(%{
        abreviatura: "some abreviatura",
        nombre: "some nombre"
      })
      |> ApiEquiposFutbol.Equipos.create_equipo()

    equipo
  end
end
