defmodule ApiEquiposFutbol.Repo.Migrations.CreateJugadores do
  use Ecto.Migration

  def change do
    create table(:jugadores) do
      add :nombre_completo, :string
      add :edad, :integer
      add :posicion_id, references(:posiciones, on_delete: :nothing)
      add :equipo_id, references(:equipos, on_delete: :nothing)

      timestamps()
    end

    create index(:jugadores, [:posicion_id])
    create index(:jugadores, [:equipo_id])
  end
end
