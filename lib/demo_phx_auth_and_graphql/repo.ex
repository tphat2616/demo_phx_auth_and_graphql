defmodule DemoPhxAuthAndGraphql.Repo do
  use Ecto.Repo,
    otp_app: :demo_phx_auth_and_graphql,
    adapter: Ecto.Adapters.Postgres
end
