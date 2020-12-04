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
                rev = "master";
                sha256 = "110yzs7k41cdm087gc2s0vabns6ryyspvbkgi9pzvmy70q4gaxnr";
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
