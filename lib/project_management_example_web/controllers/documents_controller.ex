defmodule ProjectManagementExampleWeb.DocumentsController do
  use ProjectManagementExampleWeb, :controller

  alias ProjectManagementExample.Management
  alias ProjectManagementExample.Management.Documents

  action_fallback ProjectManagementExampleWeb.FallbackController

  def index(conn, _params) do
    documents = Management.list_documents()
    render(conn, "index.json", documents: documents)
  end

  def create(conn, %{"documents" => documents_params}) do
    with {:ok, %Documents{} = documents} <- Management.create_documents(documents_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.documents_path(conn, :show, documents))
      |> render("show.json", documents: documents)
    end
  end

  def show(conn, %{"id" => id}) do
    documents = Management.get_documents!(id)
    render(conn, "show.json", documents: documents)
  end

  def update(conn, %{"id" => id, "documents" => documents_params}) do
    documents = Management.get_documents!(id)

    with {:ok, %Documents{} = documents} <- Management.update_documents(documents, documents_params) do
      render(conn, "show.json", documents: documents)
    end
  end

  def delete(conn, %{"id" => id}) do
    documents = Management.get_documents!(id)

    with {:ok, %Documents{}} <- Management.delete_documents(documents) do
      send_resp(conn, :no_content, "")
    end
  end
end
