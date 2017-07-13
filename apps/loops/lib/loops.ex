defmodule Loops do
  @moduledoc """
  Documentation for Loops.
  """

  @doc """
  Implementación recursiva de la función de Fibonacci.
  """
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) when n > 1 do
    fib(n - 1) + fib(n - 2)
  end

  @doc """
  Implementación recursiva de la función factorial.
  """
  def fact(1), do: 1
  def fact(n) when n > 1 do
    n * fact(n - 1)
  end

  @doc """
  Implementación de Fibonacci usando _tail call_.
  """
  def fib_TCO(0), do: 0
  def fib_TCO(1), do: 1
  def fib_TCO(n) when n > 1 do
    do_fib_TCO(n - 2, 0, 1)
  end

  defp do_fib_TCO(0, f1, f2), do: f1 + f2
  defp do_fib_TCO(n, f1, f2) do
    do_fib_TCO(n - 1, f2, f2 + f1)
  end

  # Tail Call Optimization
  @doc """
  Implementación de factorial usando _tail call_.
  """
  def fact_TCO(n) when n > 0 do
    do_fact_TCO(n, 1)
  end

  defp do_fact_TCO(1, acc), do: acc
  defp do_fact_TCO(n, acc) do
    do_fact_TCO(n - 1, n * acc)
  end

  # Listas y recursividad.
  @doc """
  Añade un valor `x` a cada uno de los elementos de la lista `l`.
  Implementación sin _tail call_.
  """
  def add_list([], _x), do: []
  def add_list([h | t] = l, x) when is_list(l) and is_number(x) do
    [h + x | add_list(t, x)]
  end

  @doc """
  Añade un valor `x` a cada uno de los elementos de la lista `l`.
  Implementación con _tail call_.
  """
  def add_list_TCO(l, x) when is_list(l) and is_number(x) do
    l
    |> do_add_list_TCO(x, []) # Puesto que la lista devuelte estará al revés.
    |> Enum.reverse() # Hemos de invertir su orden.
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
