defmodule EctoIssue.Repo.Migrations.CreateDogs do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add(:house_id, references(:houses, on_delete: :nothing))
      add(:age, :integer)

      timestamps(type: :utc_datetime)
    end

    create(index(:dogs, [:house_id]))
  end
end
