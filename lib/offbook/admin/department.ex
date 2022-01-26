defmodule Offbook.Admin.Department do
  use Ecto.Schema
  import Ecto.Changeset

  schema "departments" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
