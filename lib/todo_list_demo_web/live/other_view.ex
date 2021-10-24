defmodule TodoListDemoWeb.OtherView do
  use LiveElement

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(
       name: "bob",
       occupation: "Destroyer of worlds"
     )}
  end
end
