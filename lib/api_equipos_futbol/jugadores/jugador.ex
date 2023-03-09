defmodule ApiEquiposFutbol.Jugadores.Jugador do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jugadores" do
    field :nombre_completo, :string
    field :edad, :integer
    belongs_to :equipo, ApiEquiposFutbol.Equipos.Equipo
    belongs_to :posicion, ApiEquiposFutbol.Posiciones.Posicion

    timestamps()
  end

  @doc false
  def changeset(jugador, attrs) do
    jugador
    |> cast(attrs, [:nombre_completo, :edad, :equipo_id, :posicion_id])
    |> validate_required([:nombre_completo, :edad])
    |> foreign_key_constraint(:posicion_id)
    |> foreign_key_constraint(:equipo_id)
  end
end
