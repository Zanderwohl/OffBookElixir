defmodule Offbook.Repo.Migrations.AddDepartmentDelete do
  use Ecto.Migration

  def change do
    alter table(:departments) do
	  add :delete, :boolean
    end
  end
end
