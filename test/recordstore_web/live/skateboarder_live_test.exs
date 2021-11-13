defmodule RecordStoreWeb.SkateboarderLiveTest do
  use RecordStoreWeb.ConnCase

  import Phoenix.LiveViewTest
  import RecordStore.SportsFixtures

  @create_attrs %{age: 42, name: "some name"}
  @update_attrs %{age: 43, name: "some updated name"}
  @invalid_attrs %{age: nil, name: nil}

  defp create_skateboarder(_) do
    skateboarder = skateboarder_fixture()
    %{skateboarder: skateboarder}
  end

  describe "Index" do
    setup [:create_skateboarder]

    test "lists all skateboarders", %{conn: conn, skateboarder: skateboarder} do
      {:ok, _index_live, html} = live(conn, Routes.skateboarder_index_path(conn, :index))

      assert html =~ "Listing Skateboarders"
      assert html =~ skateboarder.name
    end

    test "saves new skateboarder", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.skateboarder_index_path(conn, :index))

      assert index_live |> element("a", "New Skateboarder") |> render_click() =~
               "New Skateboarder"

      assert_patch(index_live, Routes.skateboarder_index_path(conn, :new))

      assert index_live
             |> form("#skateboarder-form", skateboarder: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#skateboarder-form", skateboarder: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.skateboarder_index_path(conn, :index))

      assert html =~ "Skateboarder created successfully"
      assert html =~ "some name"
    end

    test "updates skateboarder in listing", %{conn: conn, skateboarder: skateboarder} do
      {:ok, index_live, _html} = live(conn, Routes.skateboarder_index_path(conn, :index))

      assert index_live |> element("#skateboarder-#{skateboarder.id} a", "Edit") |> render_click() =~
               "Edit Skateboarder"

      assert_patch(index_live, Routes.skateboarder_index_path(conn, :edit, skateboarder))

      assert index_live
             |> form("#skateboarder-form", skateboarder: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#skateboarder-form", skateboarder: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.skateboarder_index_path(conn, :index))

      assert html =~ "Skateboarder updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes skateboarder in listing", %{conn: conn, skateboarder: skateboarder} do
      {:ok, index_live, _html} = live(conn, Routes.skateboarder_index_path(conn, :index))

      assert index_live |> element("#skateboarder-#{skateboarder.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#skateboarder-#{skateboarder.id}")
    end
  end

  describe "Show" do
    setup [:create_skateboarder]

    test "displays skateboarder", %{conn: conn, skateboarder: skateboarder} do
      {:ok, _show_live, html} = live(conn, Routes.skateboarder_show_path(conn, :show, skateboarder))

      assert html =~ "Show Skateboarder"
      assert html =~ skateboarder.name
    end

    test "updates skateboarder within modal", %{conn: conn, skateboarder: skateboarder} do
      {:ok, show_live, _html} = live(conn, Routes.skateboarder_show_path(conn, :show, skateboarder))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Skateboarder"

      assert_patch(show_live, Routes.skateboarder_show_path(conn, :edit, skateboarder))

      assert show_live
             |> form("#skateboarder-form", skateboarder: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#skateboarder-form", skateboarder: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.skateboarder_show_path(conn, :show, skateboarder))

      assert html =~ "Skateboarder updated successfully"
      assert html =~ "some updated name"
    end
  end
end
