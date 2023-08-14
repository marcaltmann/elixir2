defmodule ListHelper do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def list_len([]), do: 0
  def list_len([_head |  tail]), do: 1 + list_len(tail)

  def list_len2(list) do
    do_list_len(0, list)
  end

  defp do_list_len(acc, []) do
    acc
  end

  defp do_list_len(acc, [_head | tail]) do
    do_list_len(acc + 1, tail)
  end


  def range(from, from), do: [from]
  def range(from, to), do: [from | range(from + 1, to)]

  def range2(from, to) do
    do_range([], from, to)
  end

  defp do_range(acc, from, from) do
    [from | acc]
  end

  defp do_range(acc, from, to) do
    do_range([to | acc], from, to - 1)
  end


  def positive([]), do: []
  def positive([head | tail]) when head > 0, do: [head | positive(tail)]
  def positive([head | tail]) when head <= 0, do: positive(tail)


  def positive2(list) do
    reverse(do_positive([], list))
  end

  defp do_positive(acc, []) do
    acc
  end

  defp do_positive(acc, [head | tail]) when head > 0 do
    do_positive([head | acc], tail)
  end

  defp do_positive(acc, [head | tail]) when head <= 0 do
    do_positive(acc, tail)
  end


  def reverse(list) do
    do_reverse([], list)
  end

  defp do_reverse(acc, []) do
    acc
  end

  defp do_reverse(acc, [head | tail]) do
    do_reverse([head | acc], tail)
  end
end
