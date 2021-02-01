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
                rev = "e53d6eedcec5e564c089dfc087159a637cc806a3";
                sha256 = "0f9h5cg3bhr8la19djayck2rnnr1rcnq68hjhyigp7j4fk6jj4nm";
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
    python38Packages.pygments
    rnix-lsp
    #rst2html5
    rsync
  ];
}
