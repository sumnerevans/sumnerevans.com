{
  description = "Sumner Evans' website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        ciPackages = with pkgs; [
          bashInteractive
          docutils
          hugo
          openring
          python3Packages.pygments
        ];
      in {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs;
              ciPackages
              ++ [ libheif linkchecker nodePackages.htmlhint openssh rsync ];
          };
          ci = pkgs.mkShell { packages = ciPackages; };
        };
      }));
}
