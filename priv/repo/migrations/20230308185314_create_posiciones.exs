defmodule ApiEquiposFutbol.Repo.Migrations.CreatePosiciones do
  use Ecto.Migration

  def change do
    create table(:posiciones) do
      add :nombre, :string
      add :abreviatura, :string

      timestamps()
    end
  end
end
