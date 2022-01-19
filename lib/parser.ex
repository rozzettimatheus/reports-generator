defmodule ReportsGenerator.Parser do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    # fn el -> String.to_integer(el) end
    |> List.update_at(2, &String.to_integer/1)
  end
end
