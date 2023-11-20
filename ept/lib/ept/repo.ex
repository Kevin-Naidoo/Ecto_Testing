defmodule Ept.Repo do
  use Ecto.Repo,
    otp_app: :ept,
    adapter: Ecto.Adapters.Postgres
end
