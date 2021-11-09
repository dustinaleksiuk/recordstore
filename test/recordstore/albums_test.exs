defmodule RecordStore.AlbumsTest do
  use RecordStore.DataCase

  alias RecordStore.Albums

  describe "albums" do
    alias RecordStore.Albums.Album

    import RecordStore.AlbumsFixtures

    @invalid_attrs %{genre: nil, name: nil, rating: nil}

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Albums.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Albums.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      valid_attrs = %{genre: "some genre", name: "some name", rating: 42}

      assert {:ok, %Album{} = album} = Albums.create_album(valid_attrs)
      assert album.genre == "some genre"
      assert album.name == "some name"
      assert album.rating == 42
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Albums.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      update_attrs = %{genre: "some updated genre", name: "some updated name", rating: 43}

      assert {:ok, %Album{} = album} = Albums.update_album(album, update_attrs)
      assert album.genre == "some updated genre"
      assert album.name == "some updated name"
      assert album.rating == 43
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Albums.update_album(album, @invalid_attrs)
      assert album == Albums.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Albums.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Albums.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Albums.change_album(album)
    end
  end
end
