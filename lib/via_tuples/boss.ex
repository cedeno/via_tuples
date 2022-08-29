defmodule ViaTuples.Boss do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl GenServer
  def init(_) do
    # start up the children
    Enum.each(1..1, fn id ->
      {:ok, pid} = ViaTuples.Worker.start_link(id)
      IO.puts("started child #{id}, pid=#{inspect pid}")
    end)
    {:ok, nil}
  end
end
