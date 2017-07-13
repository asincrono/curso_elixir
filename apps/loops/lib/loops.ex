defmodule Loops do
  @moduledoc """
  Documentation for Loops.
  """

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) when n > 1 do
    fib(n - 1) + fib(n - 2)
  end

  def fact(1), do: 1
  def fact(n) when n > 1 do
    n * fact(n - 1)
  end

  # Tail Call Optimization
  def fact_TCO(n) when n > 0 do
    do_fact_TCO(n, 1)
  end

  defp do_fact_TCO(1, acc), do: acc
  defp do_fact_TCO(n, acc) do
    do_fact_TCO(n - 1, n * acc)
  end

  # Listas y recursividad.
  def add_list([], _x), do: []
  def add_list([h | t] = l, x) when is_list(l) and is_number(x) do
    [h + x | add_list(t, x)]
  end

  def add_list_TCO(l, x) when is_list(l) and is_number(x) do
    do_add_list_TCO(l, x, [])
    |> Enum.reverse()
  end

  defp do_add_list_TCO([], _x, acc), do: acc
  defp do_add_list_TCO([h | t], x, acc) do
    do_add_list_TCO(t, x, [h + x | acc])
  end

  @doc """
  Hello world.

  ## Examples

      iex> Loops.hello
      :world

  """
  def hello do
    :world
  end
end
