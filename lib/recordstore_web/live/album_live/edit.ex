defmodule RecordStoreWeb.AlbumLive.Edit do
  use RecordStoreWeb, :live_view

  alias RecordStore.Albums
  alias RecordStore.Albums.Album
  alias RecordStore.Albums.Track
  alias RecordStoreWeb.AlbumLive.TracksComponent

  alias Ecto.Changeset

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    album = RecordStore.Albums.get_album!(id, true)

    album = preload_temp_ids(album)

    changeset = Albums.change_album(album)

    socket
    |> assign(:page_title, "Edit Album")
    |> assign(:album, album)
    |> assign(:changeset, changeset)
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Album")
    |> assign(:album, %Album{})
  end

  defp preload_temp_ids(album) do
    updated_tracks = Enum.map(album.tracks, fn t -> %Track{t | temp_id: Ecto.UUID.generate()} end)
    %Album{album | tracks: updated_tracks}
  end

  @impl true
  def handle_event("change", %{"album" => album_params}, socket) do
    changeset =
      socket.assigns.album
      |> Albums.change_album(album_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("add-track", _params, socket) do
    changeset = socket.assigns.changeset
    temp_id = Ecto.UUID.generate()

    tracks =
      Changeset.get_field(changeset, :tracks)
      |> Enum.concat([%Track{temp_id: temp_id}])

    changeset = Changeset.put_assoc(changeset, :tracks, tracks)
    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("remove-track", %{"temp-id" => temp_id}, %{assigns: assigns} = socket) do
    tracks =
      Changeset.get_field(assigns.changeset, :tracks)
      |> Enum.reject(&(&1.temp_id == temp_id))

    changeset = Changeset.put_assoc(assigns.changeset, :tracks, tracks)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"album" => album_params}, socket) do
    save_album(socket, socket.assigns.live_action, album_params)
  end

  defp save_album(socket, :edit, album_params) do
    case Albums.update_album(socket.assigns.album, album_params) do
      {:ok, _album} ->
        {:noreply,
         socket
         |> put_flash(:info, "Album updated successfully")
         |> push_redirect(to: Routes.album_index_path(socket, :index))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end
end
