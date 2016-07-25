defmodule Hacktiv8Challenges.Router do
  use Hacktiv8Challenges.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hacktiv8Challenges do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/read/:batch_id/:id", PageController, :show
    resources "/challenges", ChallengeController
    resources "/batches", BatchController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hacktiv8Challenges do
  #   pipe_through :api
  # end
end
