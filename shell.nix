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
                rev = "c6a704383a79b9bdc1234b47f240276651561eb0";
                sha256 = "16bhxqjs3vgxxxib03sfghfn14ldx64fvirygvcnziy0xzhwd70v";
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
