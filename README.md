# Mulligan Cards

## Description

Mulligan Cards is a project that allows players of Legends of Runeterra to simulate mulliganing their opening hand. It is intended to be used as a puzzle game to learn how to best mulligan against favorable and unfavorable matchups.

## Development

### Setup

The project is built using Visual Studio Code `Dev Containers`. To get started, install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension and open the project in a container.

#### Description

The `Dev Container` template in this project was bootstrapped by using the officially provided template from Microsoft. The latest version of the template can be found [here](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/elixir-phoenix-postgres).

It may be necessary to update the config from the template in the future. An automatic process to do so is not yet in place.

#### Dev Container

##### Creating the Dev Container template

The following steps were taken to create the `devcontainer` template:

1. Open the project in vscode-insiders (required for the `Remote - Containers` extension)
2. Run the `Dev Containers: Add Dev Container Configuration Files` command from the command palette
3. Select the `Elixir, Phoenix, Node.js & PostgresSQL (community)` template
4. Hit enter to create the `.devcontainer` folder in the project root

##### Testing the Dev Container setup

In order to test the Dev Container setup itself, run the following command from within the Dev Container shell:

```bash
bash ./test-project/test.sh
```
