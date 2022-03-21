{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        go = pkgs.go_1_18.overrideAttrs (oldAttrs: rec {
          version = "1.18";
          src = pkgs.fetchurl {
            url = "https://dl.google.com/go/go${version}.src.tar.gz";
            sha256 = "sha256-OPQj20zINIg/K1I0QoL6ejn7uTZQ3GKhH98L5kCb2tY=";
          };
        });
        pkgs = import nixpkgs {
          inherit system;
          config = {
            packageOverrides = pkgs: {
              buildGoModule = pkgs.buildGoModule.override {go = go;};
              go = go;
            };
          };
        };
      in {
        devShell = with pkgs;
          mkShell {
            buildInputs = [
              go
              alejandra
              which
              curl
              golangci-lint
              yamllint
              git
              nodejs-16_x
            ];
          };
      }
    );
}
