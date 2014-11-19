defmodule GolTest do
  use ExUnit.Case

  test "representing the board" do
    b = %{:width => 3,
         :height => 4,
         :board_data => Enum.into([{0, 1},
                                   {1, 1},
                                   {2, 1}],
                                  HashSet.new)}
    assert Gol.render_board(b) == " O \n O \n O \n   \n"
  end
end
