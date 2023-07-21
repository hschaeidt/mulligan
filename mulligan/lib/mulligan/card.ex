defmodule Mulligan.Card do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:card_code, :string, autogenerate: false}

  schema "cards" do
    field :name, :string
    field :set, :string
    field :type, :string
    field :version, {:array, :string}
    field :description, :string
    field :keywords, {:array, :string}
    field :formats, {:array, :string}
    field :associated_cards, {:array, :string}
    field :associated_card_refs, {:array, :string}
    field :assets_path, :string
    field :assets_full_path, :string
    field :regions, {:array, :string}
    field :region_refs, {:array, :string}
    field :attack, :integer
    field :cost, :integer
    field :health, :integer
    field :description_raw, :string
    field :levelup_description, :string
    field :levelup_description_raw, :string
    field :flavor_text, :string
    field :artist_name, :string
    field :keyword_refs, {:array, :string}
    field :spell_speed, :string
    field :spell_speed_ref, :string
    field :rarity, :string
    field :rarity_ref, :string
    field :subtypes, {:array, :string}
    field :supertype, :string
    field :collectible, :boolean, default: false
    field :format_refs, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:associated_cards, :associated_card_refs, :assets_path, :assets_full_path, :regions, :region_refs, :attack, :cost, :health, :description, :description_raw, :levelup_description, :levelup_description_raw, :flavor_text, :artist_name, :name, :card_code, :keywords, :keyword_refs, :spell_speed, :spell_speed_ref, :rarity, :rarity_ref, :subtypes, :supertype, :type, :collectible, :set, :formats, :format_refs, :version])
    |> validate_required([:regions, :region_refs, :attack, :cost, :name, :card_code, :keywords, :keyword_refs, :rarity, :rarity_ref, :collectible, :set])
    |> unique_constraint(:card_code)
  end
end
