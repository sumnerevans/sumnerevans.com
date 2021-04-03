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
    ];
  };
  lib = pkgs.lib;

  openring = with pkgs; buildGoModule rec {
    pname = "openring";
    version = "master";

    src = fetchFromSourcehut {
      owner = "~sircmpwn";
      repo = pname;
      rev = "f13edb5dfd882ce608d61cf6b6740650ce9d84a3";
      sha256 = "sha256-Z65V77JZ9jCzBg7T2+d5Agxxd+MV2R7nYcLedYP5eOE=";
    };

    vendorSha256 = "sha256-BbBTmkGyLrIWphXC+dBaHaVzHuXRZ+4N/Jt2k3nF7Z4=";
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    docutils
    hugo
    openring
    python3Packages.pygments
  ] ++ (lib.lists.optional (!forWebsiteBuild) [
    git
    linkchecker
    nodePackages.htmlhint
    openssh
    rnix-lsp
    rsync
    vale
  ]);
}
