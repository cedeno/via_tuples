defmodule ViaTuples.Worker do
  use GenServer

  def start_link(_) do
    IO.puts("Starting Worker")
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl GenServer
  def init(_), do: {:ok, nil}

  def hello() do
    reply = GenServer.call(__MODULE__, :hello)
    IO.puts("hello=#{inspect reply}")
  end

  @impl GenServer
  def handle_call(request, _, _) do
    IO.puts("handle_call: request=#{inspect request}")
    {:reply, "world", nil}
  end
end
