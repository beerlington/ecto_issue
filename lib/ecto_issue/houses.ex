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
        )
    )
    |> select([h], %{count: count(h.id)})
    |> Repo.all()
  end

  def get_frag do
    House
    |> join(:inner, [h], assoc(h, :dogs), as: :dog)
    |> having(
      [h, dog: d],
      sum(d.age) > 0 or
        fragment("exists(select 1 from dogs where age > 0)")
    )
    |> select([h], %{count: count(h.id)})
    |> Repo.all()
  end
end
