defmodule EnumFunc.MiEnum do
  defstruct [data: {}, length: 0, casino: true]

  def valid?(%__MODULE__{} = d) do
    tuple_size(d.data) === d.length
  end

  defimpl Enumerable, for: EnumFunc.MiEnum do
    def count(d), do: d.length

    def member?(d, elem) do
      do_member?(d.length, d, elem)
    end

    defp do_member?(0, _, _), do: false
    defp do_member?(idx, d, elem) do
      if elem(d.data, idx - 1) === elem do
        true
      else
        do_member?(idx - 1, d, elem)
      end
    end

    def reduce(_d, {:halt, %{acc: acc}}, _func), do: {:halted, acc}

    def reduce(d, {:suspend, %{idx: idx, acc: acc}}, func) do
      {:suspended, acc,
        &reduce(d, {elem(&1, 0), %{idx: idx, acc: elem(&1, 1)}}, func)}
    end

    def reduce(_d, {:cont, %{idx: 0, acc: acc}}, _func), do: {:done, acc}
    def reduce(d, {:cont, %{idx: idx, acc: acc}}, func) do
      element = elem(d.data, idx - 1)
      {next_tag, next_acc} = func.(element, acc)
      reduce(d, {next_tag, %{idx: idx - 1, acc: next_acc}}, func)
    end

    # Entry point
    def reduce(d, {:cont, acc}, func) do
      reduce(d, {:cont, %{idx: d.length, acc: acc}}, func)
    end
  end
end
