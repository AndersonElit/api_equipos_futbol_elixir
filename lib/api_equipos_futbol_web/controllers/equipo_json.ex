defmodule ApiEquiposFutbolWeb.EquipoJSON do
  alias ApiEquiposFutbol.Equipos.Equipo

  @doc """
  Renders a list of equipos.
  """
  def index(%{equipos: equipos}) do
    %{data: for(equipo <- equipos, do: data(equipo))}
  end

  @doc """
  Renders a single equipo.
  """
  def show(%{equipo: equipo}) do
    %{data: data(equipo)}
  end

  defp data(%Equipo{} = equipo) do
    %{
      id: equipo.id,
      nombre: equipo.nombre,
      abreviatura: equipo.abreviatura
    }
  end
end
