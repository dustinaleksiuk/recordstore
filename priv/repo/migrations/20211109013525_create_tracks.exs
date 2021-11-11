defmodule RecordStore.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :name, :string
      add :position, :integer
      add :album_id, references(:albums, on_delete: :delete_all)

      timestamps()
    end

    create index(:tracks, [:album_id])
  end
end
