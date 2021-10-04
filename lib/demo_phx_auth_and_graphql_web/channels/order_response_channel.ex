defmodule DemoPhxAuthAndGraphqlWeb.OrderResponseChannel do
  use DemoPhxAuthAndGraphqlWeb, :channel

  @impl true
  def join("order_respond:lobby", _payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "order_respond", payload)
    {:noreply, socket}
  end
end
