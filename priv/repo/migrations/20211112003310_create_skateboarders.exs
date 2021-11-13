defmodule RecordStore.Repo.Migrations.CreateSkateboarders do
  use Ecto.Migration

  def change do
    create table(:skateboarders) do
      add :name, :string
      add :age, :integer

      timestamps()
    end
  end
end
