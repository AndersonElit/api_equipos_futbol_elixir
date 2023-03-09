defmodule ApiEquiposFutbol.Equipos.Equipo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipos" do
    field :nombre, :string
    field :abreviatura, :string
    has_many :jugadores, ApiEquiposFutbol.Jugadores.Jugador
    timestamps()
  end

  @doc false
  def changeset(equipo, attrs) do
    equipo
    |> cast(attrs, [:nombre, :abreviatura])
    |> validate_required([:nombre, :abreviatura])
    |> cast_assoc(:jugadores)
  end
end
