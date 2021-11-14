defmodule RecordStoreWeb.AlbumLive.TracksComponent do
  use RecordStoreWeb, :live_component

  @impl true
  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end
end
