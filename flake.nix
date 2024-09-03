{
  description = "Sumner Evans' website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (self: super: {
              hugo = super.hugo.overrideAttrs (old: {
                src = super.fetchFromGitHub {
                  owner = "gohugoio";
                  repo = "hugo";
                  rev = "v0.134.0";
                  sha256 =
                    "sha256-XglHrV+MD9Nq1qwJB63eATuS+6SwjZVF5u6H5EejEow=";
                };
                vendorHash =
                  "sha256-oDa5uWQ/vFSmTNwZ3zsYtsuLCzddV9DeaEGx5krwWRE=";
              });
            })
          ];
        };
      in {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              hugo
              openring
              libheif
              nodePackages.htmlhint
              vale
            ];
          };
        };
      }));
}
