defmodule RecordStore.Albums.Album do
  use Ecto.Schema
  import Ecto.Changeset

  schema "albums" do
    field :genre, :string
    field :name, :string
    field :rating, :integer

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:name, :rating, :genre])
    |> validate_required([:name, :rating, :genre])
  end
end
