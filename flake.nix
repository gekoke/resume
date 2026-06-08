{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    typix.url = "github:loqusion/typix";

    flake-parts.url = "github:hercules-ci/flake-parts";

    systems.url = "github:nix-systems/default";

    font-awesome.url = "github:FortAwesome/Font-Awesome";
    font-awesome.flake = false;

    pre-commit.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.pre-commit.flakeModule ];
      systems = import inputs.systems;
      perSystem =
        {
          self',
          lib,
          pkgs,
          system,
          config,
          ...
        }:
        let
          typix = inputs.typix.lib.${system};
          virtualPaths = [
            {
              dest = "icons";
              src = "${inputs.font-awesome}/svgs/";
            }
          ];
        in
        {
          packages = {
            default = self'.packages.resume;

            resume =
              (typix.buildTypstProject {
                src = typix.cleanTypstSource ./.;
                inherit virtualPaths;
              }).overrideAttrs
                (_: {
                  patchPhase = ''
                    runHook prePatch
                    substituteInPlace main.typ \
                        --replace-fail "%%GIT_REV%%" "${inputs.self.sourceInfo.rev or "UNCOMMITTED CHANGES"}"
                    runHook postPatch
                  '';
                });

            watchScript = typix.watchTypstProject { inherit virtualPaths; };
          };

          apps = {
            default = self'.apps.watch;

            watch = {
              type = "app";
              program = "${self'.packages.watchScript}/bin/typst-watch";
            };
          };

          devShells.default = typix.devShell {
            packages = [ pkgs.typstyle ];
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };

          checks = {
            build = self'.packages.resume;
          };

          pre-commit = {
            check.enable = true;
            settings = {
              hooks = {
                typstyle = {
                  enable = true;
                  name = "typstyle";
                  entry = "${lib.getExe pkgs.typstyle} format-all";
                  pass_filenames = false;
                };
                spellcheck = {
                  enable = true;
                  name = "spellcheck";
                  entry = "${pkgs.nodePackages.cspell}/bin/cspell main.typ";
                  pass_filenames = false;
                };
              };
            };
          };
        };
    };
}
