defmodule EctoIssue.House do
  use Ecto.Schema
  import Ecto.Changeset

  schema "houses" do
    timestamps(type: :utc_datetime)
    has_many(:dogs, EctoIssue.Dog)
  end

  @doc false
  def changeset(house, attrs) do
    house
    |> cast(attrs, [])
    |> validate_required([])
  end
end
