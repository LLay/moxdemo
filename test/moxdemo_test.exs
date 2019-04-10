defmodule MoxDemoTest do
  use ExUnit.Case
  import Mox

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  test "setting expectations with Mox" do
    # Don't call to stdin, just return 40 instead
    MoxDemo.InfoGathererMock
    |> expect(:get_age, 2, fn _name -> 40 end)

    assert [{"Vigo", 40}, {"Yanna", 40}] = MoxDemo.greet_many(["Vigo", "Yanna"])
  end
end
