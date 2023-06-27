defmodule Mulligan.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :associated_cards, {:array, :string}
      add :associated_card_refs, {:array, :string}
      add :assets_path, :string
      add :assets_full_path, :string
      add :regions, {:array, :string}
      add :region_refs, {:array, :string}
      add :attack, :integer
      add :cost, :integer
      add :health, :integer
      add :description, :string
      add :description_raw, :string
      add :levelup_description, :string
      add :levelup_description_raw, :string
      add :flavor_text, :string
      add :artist_name, :string
      add :name, :string
      add :card_code, :string
      add :keywords, {:array, :string}
      add :keyword_refs, {:array, :string}
      add :spell_speed, :string
      add :spell_speed_ref, :string
      add :raritiy, :string
      add :rarity_ref, :string
      add :subtypes, {:array, :string}
      add :supertype, :string
      add :type, :string
      add :collectible, :boolean, default: false, null: false
      add :set, :string
      add :formats, {:array, :string}
      add :format_refs, {:array, :string}
      add :version, {:array, :string}

      timestamps()
    end
  end
end
