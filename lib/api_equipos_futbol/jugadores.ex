defmodule ApiEquiposFutbol.Jugadores do
  @moduledoc """
  The Jugadores context.
  """

  import Ecto.Query, warn: false
  alias ApiEquiposFutbol.Repo

  alias ApiEquiposFutbol.Jugadores.Jugador

  @doc """
  Returns the list of jugadores.

  ## Examples

      iex> list_jugadores()
      [%Jugador{}, ...]

  """
  def list_jugadores do
    Repo.all(Jugador)
  end

  @doc """
  Gets a single jugador.

  Raises `Ecto.NoResultsError` if the Jugador does not exist.

  ## Examples

      iex> get_jugador!(123)
      %Jugador{}

      iex> get_jugador!(456)
      ** (Ecto.NoResultsError)

  """
  def get_jugador!(id), do: Repo.get!(Jugador, id)

  @doc """
  Creates a jugador.

  ## Examples

      iex> create_jugador(%{field: value})
      {:ok, %Jugador{}}

      iex> create_jugador(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_jugador(attrs \\ %{}) do
    %Jugador{}
    |> Jugador.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a jugador.

  ## Examples

      iex> update_jugador(jugador, %{field: new_value})
      {:ok, %Jugador{}}

      iex> update_jugador(jugador, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_jugador(%Jugador{} = jugador, attrs) do
    jugador
    |> Jugador.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a jugador.

  ## Examples

      iex> delete_jugador(jugador)
      {:ok, %Jugador{}}

      iex> delete_jugador(jugador)
      {:error, %Ecto.Changeset{}}

  """
  def delete_jugador(%Jugador{} = jugador) do
    Repo.delete(jugador)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking jugador changes.

  ## Examples

      iex> change_jugador(jugador)
      %Ecto.Changeset{data: %Jugador{}}

  """
  def change_jugador(%Jugador{} = jugador, attrs \\ %{}) do
    Jugador.changeset(jugador, attrs)
  end

end
