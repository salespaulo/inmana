defmodule Inmana.Supplies.ExpirationScheduler do
  use GenServer
  alias Inmana.Supplies.ExpirationNotification

  def start_link(init_state) do
    GenServer.start_link(__MODULE__, init_state)
  end

  @impl true
  def init(state \\ %{}) do
    schedule_notify()
    {:ok, state}
  end

  # Async
  @impl true
  def handle_info(:generate, state) do
    IO.puts("Recebe de todos processos msgs")
    ExpirationNotification.send()
    schedule_notify()
    {:noreply, state}
  end

  # Async
  @impl true
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # Sync, retorna pra quem chamou
  @impl true
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  defp schedule_notify do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
