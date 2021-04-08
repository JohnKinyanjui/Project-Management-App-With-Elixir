defmodule ProjectManagementExampleWeb.DocumentsView do
  use ProjectManagementExampleWeb, :view
  alias ProjectManagementExampleWeb.DocumentsView

  def render("index.json", %{documents: documents}) do
    %{data: render_many(documents, DocumentsView, "documents.json")}
  end

  def render("show.json", %{documents: documents}) do
    %{data: render_one(documents, DocumentsView, "documents.json")}
  end

  def render("documents.json", %{documents: documents}) do
    %{id: documents.id}
  end
end
