{
  description = "A development environment to build and test Prometheus";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        go = pkgs.go_1_19;
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
              jq
              docker
              git
              nodejs-16_x
              gofumpt
              gotools
            ];
          };
      }
    );
}
