defmodule RecordStoreWeb.PageController do
  use RecordStoreWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
