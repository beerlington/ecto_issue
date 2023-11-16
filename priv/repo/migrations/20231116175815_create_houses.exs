defmodule EctoIssue.Repo.Migrations.CreateHouses do
  use Ecto.Migration

  def change do
    create table(:houses) do
      timestamps(type: :utc_datetime)
    end
  end
end
