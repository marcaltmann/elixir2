"./pairs.csv"
  |> Path.expand(__DIR__)
  |> File.stream!
  |> Stream.drop(1)
  |> Stream.map(&String.trim(&1, "\n"))
  |> Stream.map(&String.split(&1, ","))
  |> Enum.map(fn(pairs) -> {elem(Float.parse(List.first(pairs)), 0), elem(Float.parse(List.last(pairs)), 0)} end)
