defmodule MoxDemo do
  @inputGathererModule Application.get_env(:moxdemo, :info_gatherer_module)

  def greet_many(names) do
    for name <- names do
      {name, @inputGathererModule.get_age(name)}
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
