defmodule ProjectManagementExample.Repo.Migrations.CreateDocuments do
  use Ecto.Migration

  def change do
    create table(:documents, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :content, :text
      add :view_count, :integer
      add :published, :boolean, default: false

      timestamps()
    end

  end
end
