defmodule TodoListDemoWeb.TodosLive.TodoList do
  use TodoListDemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(todo_items: ["Put your left foot in", "Take your left foot out"])}
  end

end
