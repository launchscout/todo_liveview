defmodule TodoListDemoWeb.TodosLive.TodoList do
  use TodoListDemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(todo_items: ["Put your left foot in", "Take your left foot out"])}
  end

  def handle_event("add_todo", %{"item" => item}, %{assigns: %{todo_items: todo_items}} = socket) do
    {:noreply, socket |> assign(todo_items: todo_items ++ [item])}
  end
end
