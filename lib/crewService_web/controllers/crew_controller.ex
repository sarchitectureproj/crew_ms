defmodule CrewServiceWeb.CrewController do
  use CrewServiceWeb, :controller

  alias CrewService.Service
  alias CrewService.Service.Crew

  action_fallback CrewServiceWeb.FallbackController

  def index(conn, _params) do
    crew = Service.list_crew()
    render(conn, "index.json", crew: crew)
  end

  def create(conn, %{"crew" => crew_params}) do
    with {:ok, %Crew{} = crew} <- Service.create_crew(crew_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", crew_path(conn, :show, crew))
      |> render("show.json", crew: crew)
    end
  end

  def show(conn, %{"id" => id}) do
    crew = Service.get_crew!(id)
    render(conn, "show.json", crew: crew)
  end

  def update(conn, %{"id" => id, "crew" => crew_params}) do
    crew = Service.get_crew!(id)

    with {:ok, %Crew{} = crew} <- Service.update_crew(crew, crew_params) do
      render(conn, "show.json", crew: crew)
    end
  end

  def delete(conn, %{"id" => id}) do
    crew = Service.get_crew!(id)
    with {:ok, %Crew{}} <- Service.delete_crew(crew) do
      send_resp(conn, :no_content, "")
    end
  end

  def authenticate(conn, %{"username" => username, "password" => password} ) do
    case Paddle.authenticate(username, password) do
      :ok -> send_resp(conn, :ok, "Ok")
      _ -> send_resp(conn, :unauthorized, "Error")
    end

  end
end
