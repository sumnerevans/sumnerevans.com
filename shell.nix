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
                rev = "9bf6ae3ac7a7cc1f48a1e70a2e72dd1c92a11473";
                sha256 = "1y3j43xjf2ln5xvs1h46iz4k1yf5ql84shri3mcsphfli363nf2n";
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
    openssh
    python38Packages.pygments
    rnix-lsp
    rst2html5
    rsync
  ];
}
