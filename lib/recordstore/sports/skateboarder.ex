defmodule RecordStore.Sports.Skateboarder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skateboarders" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(skateboarder, attrs) do
    skateboarder
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
