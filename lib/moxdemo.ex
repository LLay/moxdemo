defmodule MoxDemo do
  @inputGathererModule Application.get_env(:moxdemo, :info_gatherer_module)

  def greet_many(names) do
    IO.inspect(Mix.env)
    IO.inspect(@inputGathererModule)
    IO.inspect(Application.get_env(:moxdemo, :info_gatherer_module))
    for name <- names do
      age = @inputGathererModule.get_age(name)

      {name, age}
    end
  end
end

defmodule MoxDemo.InfoGatherer do
  @callback get_age(charlist()) :: integer()
end

defmodule MoxDemo.CLIInfoGatherer do
  @behaviour MoxDemo.InfoGatherer

  @impl MoxDemo.InfoGatherer
  def get_age(name) do
    Integer.parse(IO.gets("How old is #{name}? "))
  end
end

defmodule MoxDemo.Calculator do
  @callback add(integer(), integer()) :: integer()
  @callback mult(integer(), integer()) :: integer()
end
