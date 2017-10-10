defmodule MemzWeb.Router do
  use MemzWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
#    plug Guardian.Plug.LoadResource
  end

  scope "/", MemzWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

   # Other scopes may use custom stacks.
   scope "/v1", MemzWeb do
     pipe_through :api

     resources "/events", EventController, only: [:create]
   end
end
