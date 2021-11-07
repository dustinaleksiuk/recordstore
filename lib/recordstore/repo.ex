defmodule RecordStore.Repo do
  use Ecto.Repo,
    otp_app: :recordstore,
    adapter: Ecto.Adapters.Postgres
end
