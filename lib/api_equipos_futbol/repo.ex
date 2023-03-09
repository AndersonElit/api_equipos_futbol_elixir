defmodule ApiEquiposFutbol.Repo do
  use Ecto.Repo,
    otp_app: :api_equipos_futbol,
    adapter: Ecto.Adapters.Postgres
end
