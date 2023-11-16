defmodule EctoIssue.Dog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dogs" do
    field(:age, :integer)
    belongs_to(:house, EctoIssue.House)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dog, attrs) do
    dog
    |> cast(attrs, [])
    |> validate_required([])
  end
end
