defmodule MyStreams do
  defp filtered_lines!(path) do
    path
      |> File.stream!()
      |> Stream.map(&(String.replace(&1, "\n", "")))
  end

  def test do
    list = ["hello", "world"]
    IO.puts("Beginning")

    stream = list
      |> Stream.each(&IO.puts/1)
      |> Stream.map(&String.upcase/1)
      |> Stream.each(&IO.puts/1)

    IO.puts("End")

    Enum.to_list(stream)
  end

  def large_lines!(path) do
    File.stream!(path)
      |> Stream.map(&(String.replace(&1, "\n", "")))
      |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_length!(path) do
    File.stream!(path)
      |> Enum.map(&String.length/1)
  end

  def longest_line_length!(path) do
    File.stream!(path)
      |> Stream.map(&String.length/1)
      |> Enum.max()
  end

  def longest_line!(path) do
    File.stream!(path)
      |> Enum.max_by(&String.length/1)
  end

  def words_per_line!(path) do
    path
      |> filtered_lines!()
      |> Enum.map(&word_count/1)
  end

  defp word_count(string) do
    string
      |> String.split()
      |> length()
  end
end
