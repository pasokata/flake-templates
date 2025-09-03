{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            python312
            uv
          ];
          shellHook = ''
            echo "uv version: $(uv --version)"
            echo "python version: $(python --version)"
            uv venv --no-managed-python --no-python-downloads --allow-existing
            source .venv/bin/activate
          '';
        };
      }
    );
}
