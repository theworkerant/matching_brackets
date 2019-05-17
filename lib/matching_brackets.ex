defmodule MatchingBrackets do
  @pair %{"{": "}", "[": "]", "(": ")"}

  def match?(string) when is_bitstring(string), do: String.graphemes(string) |> match?

  def match?([]), do: true

  def match?(all_chars = [opener | _]) do
    closer = Map.get(@pair, :"#{opener}")
    chars_length = length(all_chars)

    all_chars
    |> Enum.with_index()
    |> Enum.reduce_while(0, fn
      {char, index}, _opens when index + 1 == chars_length and char != closer ->
        {:halt, nil}

      {char, index}, 1 when char == closer ->
        {:halt, index}

      {char, _index}, opens when char == opener ->
        {:cont, opens + 1}

      {char, _index}, opens when char == closer ->
        {:cont, opens - 1}

      {_char, _index}, opens ->
        {:cont, opens}
    end)
    |> unwrap(all_chars)
  end

  defp unwrap(nil, _chars), do: false

  defp unwrap(closerIndex, _chars) when rem(closerIndex + 1, 2) > 0, do: false

  defp unwrap(closerIndex, chars) do
    chars
    |> List.delete_at(closerIndex)
    |> List.delete_at(0)
    |> match?
  end
end
