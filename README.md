# Nix Flake Templates

> A collection of Nix Flake templates.

## Templates

| Name                                            | Type           | Description                                                  |
| :---------------------------------------------- | :------------- | :----------------------------------------------------------- |
| [minimal](./minimal/flake.nix)                  | Utils          | A minimal flake with a empty development shell.              |
| [node-typescrtipt](./node-typescript/flake.nix) | Language Utils | A flake for developing Node.js applications with TypeScript. |

## Usage

Create a new flake from a template with one of the following commands:

```sh
nix flake init -t github:dominicegginton/flake-templates#[template-name]               # Create a new flake from template in the current working directory.
nix flake new --t github:dominicegginton/flake-templates#[template-name] [projct-name] # Create a new flake from tmplate and create the projects names workspace directory.
```
