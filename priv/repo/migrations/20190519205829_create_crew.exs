defmodule CrewService.Repo.Migrations.CreateCrew do
  use Ecto.Migration

  def change do
    create table(:crew) do
      add :username, :string
      add :name, :string
      add :email, :string
      add :phone_number, :string
      add :role, :string

      timestamps()
    end

    create unique_index(:crew, [:username])
    create unique_index(:crew, [:email])
  end
end
