defmodule ViaTuples.Worker do
  use GenServer

  def start_link(id) do
    IO.puts("Starting Worker #{id}")
    GenServer.start_link(__MODULE__, id, name: __MODULE__)
  end

  @impl GenServer
  def init(id), do: {:ok, id}

  def hello() do
    reply = GenServer.call(__MODULE__, :hello)
    IO.puts("hello=#{inspect reply}")
  end

  @impl GenServer
  def handle_call(request, _, id) do
    IO.puts("handle_call: worker_id=#{id}, request=#{inspect request}")
    {:reply, "world", id}
  end
end
