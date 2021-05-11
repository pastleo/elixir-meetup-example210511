defmodule Example210511 do
  alias Example210511.TicketSeat
  #@seat_max 9999
  @seat_max 9

  def spawn_tasks_to_book do
    Enum.map(0..(@seat_max + 2), fn _ ->
      Task.async(&book_until_success/0)
    end)
    |> Enum.map(&Task.await/1)
  end

  def book_until_success do
    start_seat = Enum.random(0..@seat_max)
    owner = [self(), Enum.random(0..1000000)]
    Enum.map((0..@seat_max), fn x -> rem(start_seat + x, @seat_max + 1) end)
    |> Enum.find(fn seat ->
      TicketSeat.book(seat, owner)
      TicketSeat.owner(seat) == owner
    end)
  end
end
