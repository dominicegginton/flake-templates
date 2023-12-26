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

    devShell = eachSystem (pkgs: pkgs.mkShell {
      packages = with pkgs; [
        gh
        alejandra
        htop
      ];
    });

    templates = {
      minimal = {
        path = ./minimal;
        description = "Minimal boilerplate";
      };

      node-typescript = {
        path = ./node-typescript;
        description = "Node.js + TypeScript";
      };
    };
  };
}
