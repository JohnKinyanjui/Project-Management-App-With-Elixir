defmodule ProjectManagementExampleWeb.DocumentsControllerTest do
  use ProjectManagementExampleWeb.ConnCase

  alias ProjectManagementExample.Management
  alias ProjectManagementExample.Management.Documents

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:documents) do
    {:ok, documents} = Management.create_documents(@create_attrs)
    documents
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all documents", %{conn: conn} do
      conn = get(conn, Routes.documents_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create documents" do
    test "renders documents when data is valid", %{conn: conn} do
      conn = post(conn, Routes.documents_path(conn, :create), documents: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.documents_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.documents_path(conn, :create), documents: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update documents" do
    setup [:create_documents]

    test "renders documents when data is valid", %{conn: conn, documents: %Documents{id: id} = documents} do
      conn = put(conn, Routes.documents_path(conn, :update, documents), documents: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.documents_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, documents: documents} do
      conn = put(conn, Routes.documents_path(conn, :update, documents), documents: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete documents" do
    setup [:create_documents]

    test "deletes chosen documents", %{conn: conn, documents: documents} do
      conn = delete(conn, Routes.documents_path(conn, :delete, documents))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.documents_path(conn, :show, documents))
      end
    end
  end

  defp create_documents(_) do
    documents = fixture(:documents)
    %{documents: documents}
  end
end
