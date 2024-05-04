{pkgs, ...}: {
  packages = with pkgs; [
  ];

  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = ./requirements.txt;
    };
  };
}
