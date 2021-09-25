defmodule TodoListDemoWeb.TodosLive.TodoList do
  use TodoListDemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(
       todo_items: [
         %{item: "Put your left foot in", due_date: Date.utc_today()},
         %{item: "Take your left foot out", due_date: Date.utc_today() |> Date.add(1)}
       ]
     )}
  end

  def handle_event(
        "add_todo",
        %{"item" => item, "due_date" => due_date},
        %{assigns: %{todo_items: todo_items}} = socket
      ) do
    {:noreply,
     socket
     |> assign(todo_items: todo_items ++ [%{item: item, due_date: Date.from_iso8601!(due_date)}])}
  end
end
