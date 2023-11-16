defmodule EctoIssue.Repo do
  use Ecto.Repo,
    otp_app: :ecto_issue,
    adapter: Ecto.Adapters.Postgres
end
