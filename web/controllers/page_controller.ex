defmodule Hacktiv8Challenges.PageController do
  use Hacktiv8Challenges.Web, :controller
  alias Hacktiv8Challenges.Challenge

  def index(conn, _params) do
    challenges = Repo.all(from challenge in Challenge,
     where: challenge.published == true,
     order_by: challenge.order_number,
     limit: 1)
    render conn, "index.html", challenges: challenges,
      layout: {Hacktiv8Challenges.LayoutView, "read.html"}
  end

  def show(conn, %{"id" => id}) do
    challenge = Repo.get!(Challenge, id)
    render conn, "show.html", challenge: challenge
  end
end
