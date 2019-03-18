defmodule MoxDemo do

end

defmodule MoxDemo.Calculator do
  @callback add(integer(), integer()) :: integer()
  @callback mult(integer(), integer()) :: integer()
end
