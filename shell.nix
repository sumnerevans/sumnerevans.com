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

  openring = with pkgs; buildGoModule {
    name = "openring";

    src = fetchgit {
      url = "https://git.sr.ht/~sircmpwn/openring";
      rev = "f13edb5dfd882ce608d61cf6b6740650ce9d84a3";
      sha256 = "1qbqz61pbpn2c7kixn8mwdvp2302g7kxplqf0srk1xjrnbpmbbk7";
    };

    vendorSha256 = "17pdqmwr6xlvzh6ywryiwlg7798xbb8gkhhmlqbb4bmj86d57c05";
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [
    docutils
    git
    hugo
    linkchecker
    nodePackages.htmlhint
    openring
    openssh
    python3Packages.pygments
    rnix-lsp
    rsync
    vale
  ];
}
