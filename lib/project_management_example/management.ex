defmodule ProjectManagementExample.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias ProjectManagementExample.Repo

  alias ProjectManagementExample.Management.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias ProjectManagementExample.Management.Documents

  @doc """
  Returns the list of documents.

  ## Examples

      iex> list_documents()
      [%Documents{}, ...]

  """
  def list_documents do
    Repo.all(Documents)
  end

  @doc """
  Gets a single documents.

  Raises `Ecto.NoResultsError` if the Documents does not exist.

  ## Examples

      iex> get_documents!(123)
      %Documents{}

      iex> get_documents!(456)
      ** (Ecto.NoResultsError)

  """
  def get_documents!(id), do: Repo.get!(Documents, id)

  @doc """
  Creates a documents.

  ## Examples

      iex> create_documents(%{field: value})
      {:ok, %Documents{}}

      iex> create_documents(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_documents(attrs \\ %{}) do
    %Documents{}
    |> Documents.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a documents.

  ## Examples

      iex> update_documents(documents, %{field: new_value})
      {:ok, %Documents{}}

      iex> update_documents(documents, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_documents(%Documents{} = documents, attrs) do
    documents
    |> Documents.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a documents.

  ## Examples

      iex> delete_documents(documents)
      {:ok, %Documents{}}

      iex> delete_documents(documents)
      {:error, %Ecto.Changeset{}}

  """
  def delete_documents(%Documents{} = documents) do
    Repo.delete(documents)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking documents changes.

  ## Examples

      iex> change_documents(documents)
      %Ecto.Changeset{data: %Documents{}}

  """
  def change_documents(%Documents{} = documents, attrs \\ %{}) do
    Documents.changeset(documents, attrs)
  end
end
