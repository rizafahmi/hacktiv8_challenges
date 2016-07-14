defmodule Hacktiv8Challenges.PageController do
  use Hacktiv8Challenges.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
