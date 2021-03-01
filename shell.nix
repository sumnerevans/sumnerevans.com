let 
  pkgs = import <nixpkgs> {
    # Use this overlay until https://github.com/gohugoio/hugo/pull/7763 is
    # merged.
    overlays = [
      (
        self: super: {
          hugo = super.hugo.overrideAttrs (
            old: {
              version = "master";
              src = self.fetchFromGitHub {
                owner = "sumnerevans";
                repo = "hugo";
                rev = "4f739f67b3c3e70853c17e10d61abb0c2bf7f2ca";
                sha256 = "1h7srlf4p9s71pjkr78miw092llfkxk80plgnziw6r8lann7vkc9";
              };
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
    openring
    openssh
    python3Packages.pygments
    rnix-lsp
    rsync
  ];
}
