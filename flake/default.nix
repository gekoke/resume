{ flake-parts
, ...
} @ inputs:
flake-parts.lib.mkFlake { inherit inputs; } {
  systems = [ "x86_64-linux" ];

  imports = [
    ./packages.nix
    ./checks.nix
    ./dev-shells.nix
  ];
}
