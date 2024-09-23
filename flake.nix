{
  description = "NixOS configuration of BIRSAx2";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      rust-overlay,
      ...
    }:
    {
      nixosConfigurations = {
        ThinkPad = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };

          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.mouhieddine = import ./home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            }
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [ rust-overlay.overlays.default ];
                environment.systemPackages = [
                  (pkgs.rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })
                ];
              }
            )
          ];
        };
      };
    };
}
