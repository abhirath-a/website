{
  description = "abhi's portfolio";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.nodejs_24
            pkgs.pnpm
          ];
        };
        packages.default = pkgs.stdenv.mkDerivation (finalAttrs: {
          pname = "portfolio";
          version = "0.0.1";
          src = ./.;
          
          nativeBuildInputs = [
            pkgs.nodejs_24
            pkgs.pnpm
            pkgs.pnpmConfigHook
          ];

          pnpmDeps = pkgs.fetchPnpmDeps {
            inherit (finalAttrs) pname version src;
            fetcherVersion = 4;
            hash = "sha256-TBXPcTm1HI3fgYMIbNY4lglE2cStcrHEnPO+yKULBsk=";
          };

          buildPhase = ''
            pnpm run build
          '';

          installPhase = ''
            cp -r dist $out
          '';
        });
      }
    );
}
