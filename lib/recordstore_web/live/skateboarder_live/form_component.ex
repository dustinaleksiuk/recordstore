defmodule RecordStoreWeb.SkateboarderLive.FormComponent do
  use RecordStoreWeb, :live_component

  alias RecordStore.Sports

  @impl true
  def update(%{skateboarder: skateboarder} = assigns, socket) do
    changeset = Sports.change_skateboarder(skateboarder)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"skateboarder" => skateboarder_params}, socket) do
    changeset =
      socket.assigns.skateboarder
      |> Sports.change_skateboarder(skateboarder_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"skateboarder" => skateboarder_params}, socket) do
    save_skateboarder(socket, socket.assigns.action, skateboarder_params)
  end

  defp save_skateboarder(socket, :edit, skateboarder_params) do
    case Sports.update_skateboarder(socket.assigns.skateboarder, skateboarder_params) do
      {:ok, _skateboarder} ->
        {:noreply,
         socket
         |> put_flash(:info, "Skateboarder updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_skateboarder(socket, :new, skateboarder_params) do
    case Sports.create_skateboarder(skateboarder_params) do
      {:ok, _skateboarder} ->
        {:noreply,
         socket
         |> put_flash(:info, "Skateboarder created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
