defmodule CrewService.Service do
  @moduledoc """
  The Service context.
  """

  import Ecto.Query, warn: false
  alias CrewService.Repo

  alias CrewService.Service.Crew

  @doc """
  Returns the list of crew.

  ## Examples

      iex> list_crew()
      [%Crew{}, ...]

  """
  def list_crew do
    Repo.all(Crew)
  end

  @doc """
  Gets a single crew.

  Raises `Ecto.NoResultsError` if the Crew does not exist.

  ## Examples

      iex> get_crew!(123)
      %Crew{}

      iex> get_crew!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crew!(id), do: Repo.get!(Crew, id)

  @doc """
  Creates a crew.

  ## Examples

      iex> create_crew(%{field: value})
      {:ok, %Crew{}}

      iex> create_crew(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crew(attrs \\ %{}) do
    %Crew{}
    |> Crew.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a crew.

  ## Examples

      iex> update_crew(crew, %{field: new_value})
      {:ok, %Crew{}}

      iex> update_crew(crew, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crew(%Crew{} = crew, attrs) do
    crew
    |> Crew.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Crew.

  ## Examples

      iex> delete_crew(crew)
      {:ok, %Crew{}}

      iex> delete_crew(crew)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crew(%Crew{} = crew) do
    Repo.delete(crew)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crew changes.

  ## Examples

      iex> change_crew(crew)
      %Ecto.Changeset{source: %Crew{}}

  """
  def change_crew(%Crew{} = crew) do
    Crew.changeset(crew, %{})
  end
end
