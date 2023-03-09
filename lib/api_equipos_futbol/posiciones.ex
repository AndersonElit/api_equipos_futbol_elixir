defmodule ApiEquiposFutbol.Posiciones do
  @moduledoc """
  The Posiciones context.
  """

  import Ecto.Query, warn: false
  alias ApiEquiposFutbol.Repo

  alias ApiEquiposFutbol.Posiciones.Posicion

  @doc """
  Returns the list of posiciones.

  ## Examples

      iex> list_posiciones()
      [%Posicion{}, ...]

  """
  def list_posiciones do
    Repo.all(Posicion)
  end

  @doc """
  Gets a single posicion.

  Raises `Ecto.NoResultsError` if the Posicion does not exist.

  ## Examples

      iex> get_posicion!(123)
      %Posicion{}

      iex> get_posicion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_posicion!(id), do: Repo.get!(Posicion, id)

  @doc """
  Creates a posicion.

  ## Examples

      iex> create_posicion(%{field: value})
      {:ok, %Posicion{}}

      iex> create_posicion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_posicion(attrs \\ %{}) do
    %Posicion{}
    |> Posicion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a posicion.

  ## Examples

      iex> update_posicion(posicion, %{field: new_value})
      {:ok, %Posicion{}}

      iex> update_posicion(posicion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_posicion(%Posicion{} = posicion, attrs) do
    posicion
    |> Posicion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a posicion.

  ## Examples

      iex> delete_posicion(posicion)
      {:ok, %Posicion{}}

      iex> delete_posicion(posicion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_posicion(%Posicion{} = posicion) do
    Repo.delete(posicion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking posicion changes.

  ## Examples

      iex> change_posicion(posicion)
      %Ecto.Changeset{data: %Posicion{}}

  """
  def change_posicion(%Posicion{} = posicion, attrs \\ %{}) do
    Posicion.changeset(posicion, attrs)
  end
end
