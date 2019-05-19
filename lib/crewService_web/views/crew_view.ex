defmodule CrewServiceWeb.CrewView do
  use CrewServiceWeb, :view
  alias CrewServiceWeb.CrewView

  def render("index.json", %{crew: crew}) do
    %{data: render_many(crew, CrewView, "crew.json")}
  end

  def render("show.json", %{crew: crew}) do
    %{data: render_one(crew, CrewView, "crew.json")}
  end

  def render("crew.json", %{crew: crew}) do
    %{id: crew.id,
      username: crew.username,
      name: crew.name,
      email: crew.email,
      phone_number: crew.phone_number,
      role: crew.role}
  end
end
