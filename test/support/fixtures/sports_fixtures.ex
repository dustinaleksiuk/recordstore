defmodule RecordStore.SportsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RecordStore.Sports` context.
  """

  @doc """
  Generate a skateboarder.
  """
  def skateboarder_fixture(attrs \\ %{}) do
    {:ok, skateboarder} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> RecordStore.Sports.create_skateboarder()

    skateboarder
  end
end
