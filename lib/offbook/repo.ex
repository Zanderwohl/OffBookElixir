defmodule Offbook.Repo do
  use Ecto.Repo,
    otp_app: :offbook,
    adapter: Ecto.Adapters.Postgres
end
