{pkgs, ...}: {
  packages = with pkgs; [
  ];

  languages.python = {
    enable = true;
    # also supports poetry and uv
    venv = {
      enable = true;
      requirements = ./requirements.txt;
    };
  };
}
