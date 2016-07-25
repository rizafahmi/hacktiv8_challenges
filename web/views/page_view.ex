defmodule Hacktiv8Challenges.PageView do
  use Hacktiv8Challenges.Web, :view
  require IEx

  def get_challenge_readme(url) do
    case HTTPoison.get(url, get_headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body |> Earmark.to_html |> Phoenix.HTML.raw
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Challenge not found"
      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end

  def get_headers do
    token = Application.get_env(:hacktiv8_challenges, GitHub)[:token]
    [{"Authorization", "token #{token}"},
     {"Accept", "application/vnd.github.v3.raw"}]
  end
end
