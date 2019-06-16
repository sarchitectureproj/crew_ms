defmodule CrewServiceWeb.Router do
  use CrewServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CrewServiceWeb do
    pipe_through :api
    resources "/crew", CrewController, except: [:new, :edit]
    post "/authenticate", CrewController, :authenticate
  end
end
