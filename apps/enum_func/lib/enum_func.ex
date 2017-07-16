defmodule EnumFunc do
  @moduledoc """
  Documentation for EnumFunc.
  """

  # Enum.all?
  def mayor_que?(l, x) when is_list(l) and is_number(x) do
    Enum.all?(l, &(&1 > x))
  end

  def menor_que?(l, x) when is_list(l) and is_number(x) do
    Enum.all?(l, fn(elem) -> elem < x end)
  end

  def numeros?(l) when is_list(l) do
    Enum.all?(l, &(is_number(&1)))
  end

  # Enum.any?
  def algun_true?(l), do: Enum.any?(l)

  def algun_positivo?(l) when is_list(l) do
    Enum.any?(l, &(&1 > 0))
  end

  # Enum.at
  def que_hay(l, idx) do
    Enum.at(l, idx - 1, "nada")
  end

  # Enum.chunk

  # Enum.chunk_by

  @doc """
  Hello world.

  ## Examples

      iex> EnumFunc.hello
      :world

  """
  def hello do
    :world
  end
end
