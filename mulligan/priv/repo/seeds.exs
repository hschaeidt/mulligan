# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mulligan.Repo.insert!(%Mulligan.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
require Logger
alias Mulligan.Repo
alias Mulligan.Card
alias Mulligan.DataDragon

import_jsons = List.flatten DataDragon.download(DataDragon.languages, "#{__DIR__}/tmp")
Logger.info("Importing #{inspect import_jsons}")

for import_json <- import_jsons do
  with {:ok, body} <- File.read(import_json), {:ok, json} <- Jason.decode(body) do
    for card <- json do
      Repo.insert_or_update!(Card.changeset(Repo.get(Card, card["cardCode"]) || %Card{}, %{
        name: card["name"],
        card_code: card["cardCode"],
        description: card["description"],
        regions: card["regions"],
        attack: card["attack"],
        health: card["health"],
        cost: card["cost"],
        rarity: card["rarity"],
        spell_speed: card["spellSpeed"],
        keywords: card["keywords"],
        type: card["type"],
        subtypes: card["subtypes"],
        supertype: card["supertype"],
        collectible: card["collectible"],
        set: card["set"],
        flavor_text: card["flavorText"],
        artist_name: card["artistName"],
        levelup_description: card["levelupDescription"],
        levelup_description_raw: card["levelupDescriptionRaw"],
        description_raw: card["descriptionRaw"],
        spell_speed_ref: card["spellSpeedRef"],
        rarity_ref: card["rarityRef"],
        region_refs: card["regionRefs"],
        keyword_refs: card["keywordRefs"],
        format_refs: card["formatRefs"],
        assets_path: card["assets"][String.to_atom("gameAbsolutePath")],
        assets_full_path: card["assets"][String.to_atom("fullAbsolutePath")],
        associated_cards: card["associatedCards"],
        associated_card_refs: card["associatedCardRefs"],
        formats: card["formats"]
      }))
    end
  else
    {:error, reason} ->
      Logger.error("Failed to insert data. Reason: #{inspect reason}")
  end
end
