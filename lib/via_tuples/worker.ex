defmodule ViaTuples.Worker do
  use GenServer

  def start_link(id) do
    IO.puts("Starting Worker #{id}")
    GenServer.start_link(__MODULE__, id, name: via_tuple(id))
  end

  @impl GenServer
  def init(id), do: {:ok, id}

  def hello(id) do
    reply = GenServer.call(via_tuple(id), :hello)
    IO.puts("hello=#{inspect reply}")
  end

  @impl GenServer
  def handle_call(request, _, id) do
    IO.puts("handle_call: worker_id=#{id}, pid=#{inspect self()} request=#{inspect request}")
    {:reply, "world", id}
  end

  defp via_tuple(id) do
    ViaTuples.ProcessRegistry.via_tuple({__MODULE__, id})
  end
end
