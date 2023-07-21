defmodule Mulligan.DataDragon do
  require Logger

  # A full list of available languages can be found here: https://developer.riotgames.com/docs/lor#data-dragon_languages
  def languages do
    [
      # "de_de",
      "en_us",
      # "es_es",
      # "es_mx",
      # "fr_fr",
      # "it_it",
      # "ja_jp",
      # "ko_kr",
      # "pl_pl",
      # "pt_br",
      # "th_th",
      # "tr_tr",
      # "ru_ru",
      # "zh_tw"
    ]
  end

  # A full list of available sets can be found here: https://developer.riotgames.com/docs/lor#data-dragon_set-bundles
  def archives(language) do
    [
      "https://dd.b.pvp.net/latest/set1-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set2-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set3-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set4-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set5-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set6-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set6cde-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set7-lite-#{language}.zip",
      "https://dd.b.pvp.net/latest/set7b-lite-#{language}.zip",
    ]
  end

  def download(languages, destination_path) do
    for language <- languages do
      for archive <- archives(language) do
        # Before doing the request verify if the archive is already downloaded
        folder_name = archive |> String.split("/") |> List.last |> String.split(".") |> List.first
        archive_path = "#{destination_path}/#{archive |> String.split("/") |> List.last}"

        if File.exists?(archive_path) do
          Logger.info("Archive #{archive_path} already downloaded")

          extract(archive_path, destination_path, folder_name, language)
        else
          Logger.info("Downloading archive #{archive_path}")

          case :httpc.request(:get, {archive, []}, [], []) do
            {:ok, {{_, 200, _}, _, body}} ->
              File.write(archive_path, body)
              extract(archive_path, destination_path, folder_name, language)
            {:error, reason} ->
              IO.inspect(reason)
          end
        end
      end
    end
  end

  def extract(archive_path, destination_path, folder_name, language) do
    case :zip.unzip(to_charlist(archive_path), [{:cwd, to_charlist("#{destination_path}/#{folder_name}")}]) do
      {:ok, _content} ->
        Logger.info("Archive #{archive_path} extracted to #{destination_path}")
        "#{destination_path}/#{folder_name}/#{language}/data/#{String.replace(folder_name, "-lite", "")}.json"
      {:error, reason} ->
        Logger.error("Failed to extract archive #{archive_path}. Reason: #{inspect reason}")
    end
  end
end
