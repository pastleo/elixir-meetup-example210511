defmodule Example210511 do
  alias Example210511.TicketSeat
  # @seat_max 9999
  # @seat_max 2999
  @seat_max 9

  def spawn_tasks_to_book do
    Enum.map(0..(@seat_max + 2), fn _ ->
      Task.async(&book_until_success/0)
    end)
    |> Enum.map(&Task.await/1)
  end

  def book_until_success do
    user = [self(), Enum.random(0..1000000)]
    Enum.shuffle(0..@seat_max)
    |> Enum.find(fn seat ->
      TicketSeat.book(seat, user)
    end)
  end
end
