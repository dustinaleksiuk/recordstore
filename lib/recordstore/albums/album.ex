defmodule RecordStore.Albums.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecordStore.Albums.Track

  schema "albums" do
    field :name, :string
    field :artist, :string
    field :genre, :string
    field :rating, :integer

    has_many(:tracks, Track,
      foreign_key: :album_id,
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:name, :artist, :genre, :rating])
    |> cast_assoc(:tracks, with: &Track.changeset/2)
    |> validate_required([:name, :rating, :genre])
  end
end
