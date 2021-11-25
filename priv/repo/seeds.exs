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

{:ok, %Album{id: revolver_id}} =
  RecordStore.Albums.create_album(%{
    name: "Revolver",
    artist: "The Beatles",
    genre: "Rock/Pop",
    rating: 8,
    tracks: [
      %{name: "Taxman", position: 1},
      %{name: "Eleanor Rigby", position: 2},
      %{name: "I'm Only Sleeping", position: 3},
      %{name: "Love You To", position: 4},
      %{name: "Here, There and Everywhere", position: 5},
      %{name: "Yellow Submarine", position: 6},
      %{name: "She Said She Said", position: 7},
      %{name: "Good Day Sunshine", position: 8},
      %{name: "And Your Bird Can Sing", position: 9},
      %{name: "For No One", position: 10},
      %{name: "Doctor Robert", position: 11},
      %{name: "I Want to Tell you", position: 12},
      %{name: "Got to Get You Into My Life", position: 13},
      %{name: "Tomorrow Never Knows", position: 14}
    ]
  })
