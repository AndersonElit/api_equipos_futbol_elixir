defmodule ApiEquiposFutbol.Posiciones.Posicion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posiciones" do
    field :nombre, :string
    field :abreviatura, :string
    has_many :jugadores, ApiEquiposFutbol.Jugadores.Jugador

    timestamps()
  end

  @doc false
  def changeset(posicion, attrs) do
    posicion
    |> cast(attrs, [:nombre, :abreviatura])
    |> validate_required([:nombre, :abreviatura])
    #|> cast_assoc(:jugadores)
  end
end
