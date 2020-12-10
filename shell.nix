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
                rev = "58000536aa1004b90fcc6835262854d37aaaee6e";
                sha256 = "0gsy5cp06jfkfhc21zy9zf5yiml4mrfi9qdw3px7ivmb86msqjy1";
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
    #rst2html5
    rsync
  ];
}
