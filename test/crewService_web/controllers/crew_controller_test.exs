defmodule CrewServiceWeb.CrewControllerTest do
  use CrewServiceWeb.ConnCase

  alias CrewService.Service
  alias CrewService.Service.Crew

  @create_attrs %{email: "some email", name: "some name", phone_number: "some phone_number", role: "some role", username: "some username"}
  @update_attrs %{email: "some updated email", name: "some updated name", phone_number: "some updated phone_number", role: "some updated role", username: "some updated username"}
  @invalid_attrs %{email: nil, name: nil, phone_number: nil, role: nil, username: nil}

  def fixture(:crew) do
    {:ok, crew} = Service.create_crew(@create_attrs)
    crew
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all crew", %{conn: conn} do
      conn = get conn, crew_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create crew" do
    test "renders crew when data is valid", %{conn: conn} do
      conn = post conn, crew_path(conn, :create), crew: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, crew_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "email" => "some email",
        "name" => "some name",
        "phone_number" => "some phone_number",
        "role" => "some role",
        "username" => "some username"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, crew_path(conn, :create), crew: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update crew" do
    setup [:create_crew]

    test "renders crew when data is valid", %{conn: conn, crew: %Crew{id: id} = crew} do
      conn = put conn, crew_path(conn, :update, crew), crew: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, crew_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "email" => "some updated email",
        "name" => "some updated name",
        "phone_number" => "some updated phone_number",
        "role" => "some updated role",
        "username" => "some updated username"}
    end

    test "renders errors when data is invalid", %{conn: conn, crew: crew} do
      conn = put conn, crew_path(conn, :update, crew), crew: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete crew" do
    setup [:create_crew]

    test "deletes chosen crew", %{conn: conn, crew: crew} do
      conn = delete conn, crew_path(conn, :delete, crew)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, crew_path(conn, :show, crew)
      end
    end
  end

  defp create_crew(_) do
    crew = fixture(:crew)
    {:ok, crew: crew}
  end
end
