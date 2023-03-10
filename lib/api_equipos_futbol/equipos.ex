defmodule ApiEquiposFutbol.Equipos do
  @moduledoc """
  The Equipos context.
  """

  import Ecto.Query, warn: false
  alias ApiEquiposFutbol.Repo

  alias ApiEquiposFutbol.Equipos.Equipo

  @doc """
  Returns the list of equipos.

  ## Examples

      iex> list_equipos()
      [%Equipo{}, ...]

  """
  def list_equipos do
    Repo.all(Equipo)
  end

  @doc """
  Gets a single equipo.

  Raises `Ecto.NoResultsError` if the Equipo does not exist.

  ## Examples

      iex> get_equipo!(123)
      %Equipo{}

      iex> get_equipo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_equipo!(id), do: Repo.get!(Equipo, id)

  @doc """
  Creates a equipo.

  ## Examples

      iex> create_equipo(%{field: value})
      {:ok, %Equipo{}}

      iex> create_equipo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_equipo(attrs \\ %{}) do
    %Equipo{}
    |> Equipo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a equipo.

  ## Examples

      iex> update_equipo(equipo, %{field: new_value})
      {:ok, %Equipo{}}

      iex> update_equipo(equipo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_equipo(%Equipo{} = equipo, attrs) do
    equipo
    |> Equipo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a equipo.

  ## Examples

      iex> delete_equipo(equipo)
      {:ok, %Equipo{}}

      iex> delete_equipo(equipo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_equipo(%Equipo{} = equipo) do
    Repo.delete(equipo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking equipo changes.

  ## Examples

      iex> change_equipo(equipo)
      %Ecto.Changeset{data: %Equipo{}}

  """
  def change_equipo(%Equipo{} = equipo, attrs \\ %{}) do
    Equipo.changeset(equipo, attrs)
  end

end
