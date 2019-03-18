defmodule MoxDemoTest do
  use ExUnit.Case

  import Mox

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  # test "invokes add and mult" do
  #   MoxDemo.CalculatorMock
  #   |> expect(:add, fn x, y -> x + y end)
  #   |> expect(:mult, fn x, y -> x * y end)
  #
  #   assert MoxDemo.CalculatorMock.add(2, 3) == 5
  #   assert MoxDemo.CalculatorMock.mult(2, 3) == 6
  # end
  #
  # test "invokes add and mult time 2" do
  #   MoxDemo.CalculatorMock
  #   |> expect(:add, fn x, y -> x + y * 2 end)
  #   |> expect(:mult, fn x, y -> x * y * 2 end)
  #
  #   assert MoxDemo.CalculatorMock.add(2, 3) == 8
  #   assert MoxDemo.CalculatorMock.mult(2, 3) == 12
  # end

  test "mocks helper module" do
    Mox.defmock(MoxDemo.InfoGathererMock, for: MoxDemo.InfoGatherer)

    MoxDemo.InfoGathererMock
    |> expect(:get_age, 2, fn _name -> 40 end)
    # TODO this does not mock. Did our test config not get read?

    IO.inspect(MoxDemo.greet_many(["Vigo", "Yanna"]))
  end
end
