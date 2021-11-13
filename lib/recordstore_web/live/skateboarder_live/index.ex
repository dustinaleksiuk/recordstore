defmodule RecordStoreWeb.SkateboarderLive.Index do
  use RecordStoreWeb, :live_view

  alias RecordStore.Sports
  alias RecordStore.Sports.Skateboarder

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :skateboarders, list_skateboarders())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Skateboarder")
    |> assign(:skateboarder, Sports.get_skateboarder!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Skateboarder")
    |> assign(:skateboarder, %Skateboarder{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Skateboarders")
    |> assign(:skateboarder, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    skateboarder = Sports.get_skateboarder!(id)
    {:ok, _} = Sports.delete_skateboarder(skateboarder)

    {:noreply, assign(socket, :skateboarders, list_skateboarders())}
  end

  defp list_skateboarders do
    Sports.list_skateboarders()
  end
end
