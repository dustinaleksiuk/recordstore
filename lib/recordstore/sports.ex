defmodule RecordStore.Sports do
  @moduledoc """
  The Sports context.
  """

  import Ecto.Query, warn: false
  alias RecordStore.Repo

  alias RecordStore.Sports.Skateboarder

  @doc """
  Returns the list of skateboarders.

  ## Examples

      iex> list_skateboarders()
      [%Skateboarder{}, ...]

  """
  def list_skateboarders do
    Repo.all(Skateboarder)
  end

  @doc """
  Gets a single skateboarder.

  Raises `Ecto.NoResultsError` if the Skateboarder does not exist.

  ## Examples

      iex> get_skateboarder!(123)
      %Skateboarder{}

      iex> get_skateboarder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skateboarder!(id), do: Repo.get!(Skateboarder, id)

  @doc """
  Creates a skateboarder.

  ## Examples

      iex> create_skateboarder(%{field: value})
      {:ok, %Skateboarder{}}

      iex> create_skateboarder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skateboarder(attrs \\ %{}) do
    %Skateboarder{}
    |> Skateboarder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skateboarder.

  ## Examples

      iex> update_skateboarder(skateboarder, %{field: new_value})
      {:ok, %Skateboarder{}}

      iex> update_skateboarder(skateboarder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skateboarder(%Skateboarder{} = skateboarder, attrs) do
    skateboarder
    |> Skateboarder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skateboarder.

  ## Examples

      iex> delete_skateboarder(skateboarder)
      {:ok, %Skateboarder{}}

      iex> delete_skateboarder(skateboarder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skateboarder(%Skateboarder{} = skateboarder) do
    Repo.delete(skateboarder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skateboarder changes.

  ## Examples

      iex> change_skateboarder(skateboarder)
      %Ecto.Changeset{data: %Skateboarder{}}

  """
  def change_skateboarder(%Skateboarder{} = skateboarder, attrs \\ %{}) do
    Skateboarder.changeset(skateboarder, attrs)
  end
end
