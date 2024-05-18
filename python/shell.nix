let
  pkgs = import <nixos> {};
in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (python-pkgs:
        with python-pkgs; [
          jupyter-collaboration
          jupyter
          jupytext
          matplotlib
          numpy
          pytorch-lightning
          scikit-image
          scikit-learn
          torch
          torchvision
        ]))
    ];
  }
