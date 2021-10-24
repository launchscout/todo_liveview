defmodule TodoListDemoWeb.TodosLive.TodoList do
  use LiveElement

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(
       todo_items: [
         %{item: "Put your left foot if", due_date: Date.utc_today()},
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

  def handle_event(
        "add_todo",
        %{"todo" => item},
        %{assigns: %{todo_items: todo_items}} = socket
      ) do
    {:noreply,
     socket
     |> assign(todo_items: todo_items ++ [%{item: item, due_date: nil}])}
  end

  def handle_event(
        "add_something",
        _payload,
        %{assigns: %{todo_items: todo_items}} = socket
      ) do
    {:noreply,
     socket
     |> assign(todo_items: todo_items ++ [%{item: "something", due_date: nil}])}
  end

  def build_events(events) do
    events
    |> Enum.map(fn %{item: item, due_date: due_date} -> %{title: item, start: due_date} end)
    |> Jason.encode!()
  end

  # def render(assigns) do
  #   ~H"""
  #     <h1>hi!</h1>
  #   """
  # end
end
