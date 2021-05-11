defmodule Example210511.TicketSeat do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def book(seat, owner) do
    Agent.update(__MODULE__, &Map.merge(%{seat => owner}, &1))
  end

  def owner(seat) do
    Agent.get(__MODULE__, &Map.get(&1, seat))
  end
end
