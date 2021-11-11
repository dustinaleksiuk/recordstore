# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RecordStore.Repo.insert!(%RecordStore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RecordStore.Albums.Album

{:ok, %Album{id: pet_sounds_id}} =
  RecordStore.Albums.create_album(%{
    name: "Pet Sounds",
    artist: "The Beach Boys",
    genre: "Rock/Pop",
    rating: 9,
    tracks: [
      %{name: "Wouldn't It Be Nice", position: 1}
    ]
  })

# field :name, :string
# field :length, :integer
# field :position, :integer
# field :album_id, :id
