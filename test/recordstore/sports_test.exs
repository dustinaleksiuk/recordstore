defmodule RecordStore.SportsTest do
  use RecordStore.DataCase

  alias RecordStore.Sports

  describe "skateboarders" do
    alias RecordStore.Sports.Skateboarder

    import RecordStore.SportsFixtures

    @invalid_attrs %{age: nil, name: nil}

    test "list_skateboarders/0 returns all skateboarders" do
      skateboarder = skateboarder_fixture()
      assert Sports.list_skateboarders() == [skateboarder]
    end

    test "get_skateboarder!/1 returns the skateboarder with given id" do
      skateboarder = skateboarder_fixture()
      assert Sports.get_skateboarder!(skateboarder.id) == skateboarder
    end

    test "create_skateboarder/1 with valid data creates a skateboarder" do
      valid_attrs = %{age: 42, name: "some name"}

      assert {:ok, %Skateboarder{} = skateboarder} = Sports.create_skateboarder(valid_attrs)
      assert skateboarder.age == 42
      assert skateboarder.name == "some name"
    end

    test "create_skateboarder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sports.create_skateboarder(@invalid_attrs)
    end

    test "update_skateboarder/2 with valid data updates the skateboarder" do
      skateboarder = skateboarder_fixture()
      update_attrs = %{age: 43, name: "some updated name"}

      assert {:ok, %Skateboarder{} = skateboarder} = Sports.update_skateboarder(skateboarder, update_attrs)
      assert skateboarder.age == 43
      assert skateboarder.name == "some updated name"
    end

    test "update_skateboarder/2 with invalid data returns error changeset" do
      skateboarder = skateboarder_fixture()
      assert {:error, %Ecto.Changeset{}} = Sports.update_skateboarder(skateboarder, @invalid_attrs)
      assert skateboarder == Sports.get_skateboarder!(skateboarder.id)
    end

    test "delete_skateboarder/1 deletes the skateboarder" do
      skateboarder = skateboarder_fixture()
      assert {:ok, %Skateboarder{}} = Sports.delete_skateboarder(skateboarder)
      assert_raise Ecto.NoResultsError, fn -> Sports.get_skateboarder!(skateboarder.id) end
    end

    test "change_skateboarder/1 returns a skateboarder changeset" do
      skateboarder = skateboarder_fixture()
      assert %Ecto.Changeset{} = Sports.change_skateboarder(skateboarder)
    end
  end
end
