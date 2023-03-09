defmodule ApiEquiposFutbol.JugadoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiEquiposFutbol.Jugadores` context.
  """

  @doc """
  Generate a jugador.
  """
  def jugador_fixture(attrs \\ %{}) do
    {:ok, jugador} =
      attrs
      |> Enum.into(%{
        edad: 42,
        nombre_completo: "some nombre_completo"
      })
      |> ApiEquiposFutbol.Jugadores.create_jugador()

    jugador
  end
end
