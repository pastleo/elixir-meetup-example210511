defmodule Example210511.TicketSeat do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def book(seat, user) do
    Agent.update(__MODULE__, &Map.merge(%{seat => user}, &1))
    Agent.get(__MODULE__, &Map.get(&1, seat)) == user
  end

  def dump() do
    Agent.get(__MODULE__, & &1)
  end
end
