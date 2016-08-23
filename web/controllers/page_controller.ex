defmodule Hacktiv8Challenges.PageController do
  require IEx
  use Hacktiv8Challenges.Web, :controller
  alias Hacktiv8Challenges.Challenge

  def index(conn, _params) do
    challenges = Repo.all(from challenge in Challenge,
     where: challenge.published == true,
     order_by: challenge.order_number)

   challenge = Enum.at(challenges, 0)
   
   redirect(conn, to: "/read/" <> to_string(challenge.batch_id) <> "/" <> to_string(challenge.id))

   render conn, "index.html", challenge: challenge, next: Enum.at(challenges, 1),
   layout: {Hacktiv8Challenges.LayoutView, "read.html"}
  end

  def show(conn, %{"batch_id" => batch_id, "id" => id}) do
    case Repo.get(Challenge, id) do
      nil ->
        render conn, "404.html"
      challenge ->
        current_challenge = Repo.all(from c in Challenge,
         where: c.published == true and c.batch_id == ^batch_id,
         order_by: c.order_number,
         limit: 1)

        next = Repo.all(from c in Challenge,
         where: c.published == true and c.id != ^id and
         c.batch_id == ^batch_id and
         c.order_number > ^challenge.order_number,
         order_by: c.order_number,
         limit: 1)

       prev = Repo.all(from c in Challenge,
        where: c.published == true and c.id != ^id and
        c.order_number < ^challenge.order_number,
        order_by: [desc: c.order_number],
        limit: 1)
      if (Enum.count(current_challenge) > 0) do
        render conn, "show.html", challenge: challenge, next: Enum.at(next, 0),prev: Enum.at(prev, 0),
      layout: {Hacktiv8Challenges.LayoutView, "read.html"}
      else
        render conn, "404.html"
      end
    end
  end
end
