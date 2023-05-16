{
  description = "Sumner Evans' website";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs-unstable, flake-utils }:
    (flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs-unstable {
            system = system;

            # Use this overlay until https://github.com/gohugoio/hugo/pull/7763 is
            # merged.
            overlays = [
              (
                self: super: {
                  hugo = super.hugo.overrideAttrs (
                    old: {
                      patches = (old.patches or [ ]) ++ [ ./hugo-rst-patches.patch ];
                    }
                  );
                }
              )
            ];
          };
          ciPackages = with pkgs; [
            bashInteractive
            docutils
            hugo
            openring
            python3Packages.pygments
          ];
        in
        {
          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; ciPackages ++ [
                libheif
                linkchecker
                nodePackages.htmlhint
                openssh
                rnix-lsp
                rsync
                vale
              ];
            };
            ci = pkgs.mkShell { packages = ciPackages; };
          };
        }
      ));
}
