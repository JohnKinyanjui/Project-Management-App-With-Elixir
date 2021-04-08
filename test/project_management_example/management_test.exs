defmodule ProjectManagementExample.ManagementTest do
  use ProjectManagementExample.DataCase

  alias ProjectManagementExample.Management

  describe "projects" do
    alias ProjectManagementExample.Management.Project

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Management.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Management.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Management.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Management.update_project(project, @update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_project(project, @invalid_attrs)
      assert project == Management.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Management.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Management.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Management.change_project(project)
    end
  end

  describe "documents" do
    alias ProjectManagementExample.Management.Documents

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def documents_fixture(attrs \\ %{}) do
      {:ok, documents} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_documents()

      documents
    end

    test "list_documents/0 returns all documents" do
      documents = documents_fixture()
      assert Management.list_documents() == [documents]
    end

    test "get_documents!/1 returns the documents with given id" do
      documents = documents_fixture()
      assert Management.get_documents!(documents.id) == documents
    end

    test "create_documents/1 with valid data creates a documents" do
      assert {:ok, %Documents{} = documents} = Management.create_documents(@valid_attrs)
    end

    test "create_documents/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_documents(@invalid_attrs)
    end

    test "update_documents/2 with valid data updates the documents" do
      documents = documents_fixture()
      assert {:ok, %Documents{} = documents} = Management.update_documents(documents, @update_attrs)
    end

    test "update_documents/2 with invalid data returns error changeset" do
      documents = documents_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_documents(documents, @invalid_attrs)
      assert documents == Management.get_documents!(documents.id)
    end

    test "delete_documents/1 deletes the documents" do
      documents = documents_fixture()
      assert {:ok, %Documents{}} = Management.delete_documents(documents)
      assert_raise Ecto.NoResultsError, fn -> Management.get_documents!(documents.id) end
    end

    test "change_documents/1 returns a documents changeset" do
      documents = documents_fixture()
      assert %Ecto.Changeset{} = Management.change_documents(documents)
    end
  end
end
