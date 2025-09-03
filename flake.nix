{
  description = "A collection of flake templates";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    {

      templates = {
        default = null;
        qmk = {
          path = ./qmk;
          description = "build keyboard firmware using QMK";
        };

        python = {
          path = ./python;
          description = "easy python project setup using uv";
        };
      };
    };
}
