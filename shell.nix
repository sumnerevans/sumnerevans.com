{ forWebsiteBuild ? false }:
let
  pkgs = import <nixpkgs> {
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
      (
        self: super: {
          docutils = super.docutils.overrideAttrs (
            old: {
              propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ [
                super.python3Packages.pygments
              ];
            }
          );
        }
      )
    ];
  };
  lib = pkgs.lib;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    docutils
    hugo
    openring
    python3Packages.pygments
  ] ++ (
    lib.lists.optional (!forWebsiteBuild) [
      git
      libheif
      linkchecker
      nodePackages.htmlhint
      openssh
      rnix-lsp
      rsync
      vale
    ]
  );
}
