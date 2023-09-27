{ inputs, ... }:
{
  imports = [
    inputs.pre-commit-hooks.flakeModule
  ];

  perSystem = { pkgs, ... }: {
    pre-commit = {
      check.enable = true;
      settings = {
        hooks = {
          spellcheck = {
            enable = true;
            name = "spellcheck";
            entry = "${pkgs.nodePackages.cspell}/bin/cspell resume.html";
            pass_filenames = false;
          };
        };
      };
    };
  };
}
