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
      %{name: "Wouldn't It Be Nice", position: 1},
      %{name: "You Still Believe In Me", position: 2},
      %{name: "That's Not Me", position: 3},
      %{name: "Don't Talk (Put Your Head on My Shoulder)", position: 4},
      %{name: "I'm Waiting For the Day", position: 5},
      %{name: "Let's Go Away for Awhile", position: 6},
      %{name: "Sloop John B", position: 7},
      %{name: "God Only Knows", position: 8},
      %{name: "I Know There's an Answer", position: 9},
      %{name: "Here Today", position: 10},
      %{name: "I Just Wasn't Made for These Times", position: 11},
      %{name: "Pet Sounds", position: 12},
      %{name: "Caroline, No", position: 13},
      %{name: "[Unreleased Backrounds]", position: 14},
      %{name: "Hang on to Your Ego", position: 15},
      %{name: "Trombone Dixie", position: 16}
    ]
  })
