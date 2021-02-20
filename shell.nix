{ pkgs ? import <nixpkgs> {
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
                rev = "6c92ca16c9cc4405f683bf1995603ca9154e30b1";
                sha256 = "0bbv6lf5bcn7d1q7lxvnrp0494bcxmcsi2d2abxn71dmndk16vvi";
              };
            }
          );
        }
      )
    ];
  }
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    docutils
    git
    hugo
    linkchecker
    openssh
    python3Packages.pygments
    rnix-lsp
    rsync
  ];
}
