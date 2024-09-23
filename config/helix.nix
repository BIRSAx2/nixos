{
  enable = true;
  defaultEditor = true;
  settings = {
    theme = "dracula";
  };
  languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        file-types = [ "nix" ];
        comment-token = "#";
        formatter = {
          command = "nixfmt";
        };
      }
    ];
  };
}
