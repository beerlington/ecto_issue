defmodule EctoIssue.Houses do
  import Ecto.Query
  alias EctoIssue.{Dog, House, Repo}

  def get do
    House
    |> join(:inner, [h], assoc(h, :dogs), as: :dog)
    |> having(
      [h, dog: d],
      sum(d.age) > 0 or
        exists(
          Dog
          |> where([d], d.age > 0)
          |> Repo.all()
        )
    )
  end
end
