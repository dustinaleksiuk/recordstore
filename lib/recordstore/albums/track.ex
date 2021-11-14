defmodule RecordStore.Albums.Track do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tracks" do
    field :name, :string
    field :position, :integer
    field :album_id, :id

    field :temp_id, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:name, :position, :temp_id])
    |> validate_required([:name, :position])
  end
end
