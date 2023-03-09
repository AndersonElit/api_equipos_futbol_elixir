defmodule ApiEquiposFutbol.PosicionesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiEquiposFutbol.Posiciones` context.
  """

  @doc """
  Generate a posicion.
  """
  def posicion_fixture(attrs \\ %{}) do
    {:ok, posicion} =
      attrs
      |> Enum.into(%{
        abreviatura: "some abreviatura",
        nombre: "some nombre"
      })
      |> ApiEquiposFutbol.Posiciones.create_posicion()

    posicion
  end
end
