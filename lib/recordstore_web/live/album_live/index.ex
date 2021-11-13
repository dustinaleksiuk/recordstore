defmodule RecordStoreWeb.AlbumLive.Index do
  use RecordStoreWeb, :live_view

  def mount(_params, _session, socket) do
    albums = RecordStore.Albums.list_albums()
    {:ok, assign(socket, :albums, albums)}
  end
end
