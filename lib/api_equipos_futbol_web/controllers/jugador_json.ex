defmodule ApiEquiposFutbolWeb.JugadorJSON do
  alias ApiEquiposFutbol.Jugadores.Jugador

  @doc """
  Renders a list of jugadores.
  """
  def index(%{jugadores: jugadores}) do
    %{data: for(jugador <- jugadores, do: data(jugador))}
  end

  @doc """
  Renders a single jugador.
  """
  def show(%{jugador: jugador}) do
    %{data: data(jugador)}
  end

  defp data(%Jugador{} = jugador) do
    %{
      id: jugador.id,
      nombre_completo: jugador.nombre_completo,
      edad: jugador.edad,
      equipo_id: jugador.equipo_id,
      posicion_id: jugador.posicion_id
    }
  end
end
