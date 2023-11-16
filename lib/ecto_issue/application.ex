defmodule EctoIssue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EctoIssueWeb.Telemetry,
      EctoIssue.Repo,
      {DNSCluster, query: Application.get_env(:ecto_issue, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EctoIssue.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EctoIssue.Finch},
      # Start a worker by calling: EctoIssue.Worker.start_link(arg)
      # {EctoIssue.Worker, arg},
      # Start to serve requests, typically the last entry
      EctoIssueWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoIssue.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EctoIssueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
