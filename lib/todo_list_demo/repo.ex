defmodule TodoListDemo.Repo do
  use Ecto.Repo,
    otp_app: :todo_list_demo,
    adapter: Ecto.Adapters.Postgres
end
