defmodule Hacktiv8Challenges.PageView do
  use Hacktiv8Challenges.Web, :view

  def get_challenge_readme(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body |> Earmark.to_html |> Phoenix.HTML.raw
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Challenge not found"
      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end
end
