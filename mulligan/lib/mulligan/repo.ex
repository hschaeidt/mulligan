defmodule Mulligan.Repo do
  use Ecto.Repo,
    otp_app: :mulligan,
    adapter: Ecto.Adapters.Postgres
end
