defmodule RecordStore.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :name, :string
      add :artist, :string
      add :rating, :integer
      add :genre, :string

      timestamps()
    end
  end
end
