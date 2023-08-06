{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      checks.${system}.spellcheck = pkgs.stdenvNoCC.mkDerivation {
        name = "spellcheck";
        src = ./.;
        nativeBuildInputs = [ pkgs.nodePackages.cspell ];
        buildPhase = ''
          mkdir $out
          cspell resume.html
        '';
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ pkgs.nodePackages.cspell ];
      };

      packages.${system}.default = pkgs.stdenvNoCC.mkDerivation {
        name = "gregor-grigorjan-resume";
        src = ./.;
        __noChroot = true;
        nativeBuildInputs = [ pkgs.chromium ];
        buildPhase = ''
          mkdir $out
          chromium --headless \
                   --disable-gpu \
                   --no-sandbox \
                   --run-all-compositor-stages-before-draw \
                   --virtual-time-budget=10000 \
                   --print-to-pdf=resume.pdf \
                     resume.html
        '';

        installPhase = ''
          mkdir -p $out/
          cp resume.pdf $out/
        '';
      };
    };
}

