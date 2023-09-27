_:
{
  perSystem = { config, pkgs, ... }: {
    devShells = {
      default = pkgs.mkShellNoCC {
        name = "resume-shell";

        nativeBuildInputs = [
          pkgs.chromium
          pkgs.nodePackages.cspell
        ];

        shellHook = ''
          ${config.pre-commit.installationScript}
        '';
      };
    };
  };
}
