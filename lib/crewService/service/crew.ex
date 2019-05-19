defmodule CrewService.Service.Crew do
  use Ecto.Schema
  import Ecto.Changeset


  schema "crew" do
    field :email, :string
    field :name, :string
    field :phone_number, :string
    field :role, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(crew, attrs) do
    crew
    |> cast(attrs, [:username, :name, :email, :phone_number, :role])
    |> validate_required([:username, :name, :email, :phone_number, :role])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
