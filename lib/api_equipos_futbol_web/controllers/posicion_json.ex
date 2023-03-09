defmodule ApiEquiposFutbolWeb.PosicionJSON do
  alias ApiEquiposFutbol.Posiciones.Posicion

  @doc """
  Renders a list of posiciones.
  """
  def index(%{posiciones: posiciones}) do
    %{data: for(posicion <- posiciones, do: data(posicion))}
  end

  @doc """
  Renders a single posicion.
  """
  def show(%{posicion: posicion}) do
    %{data: data(posicion)}
  end

  defp data(%Posicion{} = posicion) do
    %{
      id: posicion.id,
      nombre: posicion.nombre,
      abreviatura: posicion.abreviatura
    }
  end
end
