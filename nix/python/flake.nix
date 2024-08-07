{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in rec {
        devShell = pkgs.mkShell {
          buildInputs = [
            (pkgs.python3.withPackages (python-pkgs:
              with python-pkgs; [
                # jupyter-collaboration
                jupyter
                jupytext
                matplotlib
                numpy
                pyscf
                plotly
                pytorch-lightning
                rdkit
                scikit-image
                scikit-learn
                # torchWithCuda
                torch
                torchvision
              ]))
          ];
        };
      }
    );
}
