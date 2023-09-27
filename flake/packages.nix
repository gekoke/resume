{ self, ... }:
{
  perSystem = { pkgs, ... }: {
      packages.default = pkgs.stdenvNoCC.mkDerivation {
        name = "gregor-grigorjan-resume";
        src = "${self}";
        __noChroot = true;

        nativeBuildInputs = [
          pkgs.chromium
          pkgs.nodePackages.cspell
        ];

        buildPhase = ''
          cspell resume.html
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
