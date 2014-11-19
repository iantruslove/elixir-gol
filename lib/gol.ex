defmodule Gol do

  def render_cell(state) do
    case state do
      :true  -> "O"
      :false -> " "
    end
  end

  def render_row(row, w, board_data) do
    Enum.reduce(0..(w-1), "", fn(col, acc) -> acc <> render_cell(Set.member?(board_data, {row, col})) end) <> "\n"
  end

  def render(_w, h, row, _board_data, rendering) when row == h do
    rendering
  end

  def render(w, h, row, board_data, rendering) do
    render(w, h, row+1, board_data, rendering <> render_row(row, w, board_data))
  end

  def render_board(board) do
    %{:width => w, :height => h, :board_data => b} = board
    render(w, h, 0, b, "")
  end
end
