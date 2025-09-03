{
  description = "A collection of flake templates";

  outputs =
    { self }:
    {

      templates = {
        default = self.templates.python;

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
