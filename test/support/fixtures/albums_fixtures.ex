defmodule RecordStore.AlbumsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RecordStore.Albums` context.
  """

  @doc """
  Generate a album.
  """
  def album_fixture(attrs \\ %{}) do
    {:ok, album} =
      attrs
      |> Enum.into(%{
        genre: "some genre",
        name: "some name",
        rating: 42
      })
      |> RecordStore.Albums.create_album()

    album
  end
end
