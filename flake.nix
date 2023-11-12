{
  description = "A collection of Nix Flake templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    systems,
    nixpkgs,
    ...
  } @ inputs: let
    eachSystem = f:
      nixpkgs.lib.genAttrs (import systems) (
        system:
          f nixpkgs.legacyPackages.${system}
      );
  in {
    formatter = eachSystem (pkgs: pkgs.alejandra);

    templates = {
      minimal = {
        path = ./minimal;
        description = "Minimal boilerplate";
      };
    };
  };
}
