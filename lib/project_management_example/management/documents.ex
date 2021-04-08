defmodule ProjectManagementExample.Management.Documents do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "documents" do

    field :name, :string
    field :content, :string
    field :view_count, :integer
    field :published, :name
    timestamps()
  end

  @doc false
  def changeset(documents, attrs) do
    documents
    |> cast(attrs, [:name, :content, :view_count, :published, :project_id])
    |> validate_required([])
  end
end
