defmodule CrewService.ServiceTest do
  use CrewService.DataCase

  alias CrewService.Service

  describe "crew" do
    alias CrewService.Service.Crew

    @valid_attrs %{email: "some email", name: "some name", phone_number: "some phone_number", role: "some role", username: "some username"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone_number: "some updated phone_number", role: "some updated role", username: "some updated username"}
    @invalid_attrs %{email: nil, name: nil, phone_number: nil, role: nil, username: nil}

    def crew_fixture(attrs \\ %{}) do
      {:ok, crew} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Service.create_crew()

      crew
    end

    test "list_crew/0 returns all crew" do
      crew = crew_fixture()
      assert Service.list_crew() == [crew]
    end

    test "get_crew!/1 returns the crew with given id" do
      crew = crew_fixture()
      assert Service.get_crew!(crew.id) == crew
    end

    test "create_crew/1 with valid data creates a crew" do
      assert {:ok, %Crew{} = crew} = Service.create_crew(@valid_attrs)
      assert crew.email == "some email"
      assert crew.name == "some name"
      assert crew.phone_number == "some phone_number"
      assert crew.role == "some role"
      assert crew.username == "some username"
    end

    test "create_crew/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Service.create_crew(@invalid_attrs)
    end

    test "update_crew/2 with valid data updates the crew" do
      crew = crew_fixture()
      assert {:ok, crew} = Service.update_crew(crew, @update_attrs)
      assert %Crew{} = crew
      assert crew.email == "some updated email"
      assert crew.name == "some updated name"
      assert crew.phone_number == "some updated phone_number"
      assert crew.role == "some updated role"
      assert crew.username == "some updated username"
    end

    test "update_crew/2 with invalid data returns error changeset" do
      crew = crew_fixture()
      assert {:error, %Ecto.Changeset{}} = Service.update_crew(crew, @invalid_attrs)
      assert crew == Service.get_crew!(crew.id)
    end

    test "delete_crew/1 deletes the crew" do
      crew = crew_fixture()
      assert {:ok, %Crew{}} = Service.delete_crew(crew)
      assert_raise Ecto.NoResultsError, fn -> Service.get_crew!(crew.id) end
    end

    test "change_crew/1 returns a crew changeset" do
      crew = crew_fixture()
      assert %Ecto.Changeset{} = Service.change_crew(crew)
    end
  end
end
