defmodule ProjectManagementExample.Repo do
  use Ecto.Repo,
    otp_app: :project_management_example,
    adapter: Ecto.Adapters.Postgres
end
