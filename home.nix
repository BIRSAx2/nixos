{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.username = "mouhieddine";
  home.homeDirectory = "/home/mouhieddine";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    trash-cli
    grc
    nixfmt-rfc-style
    fastfetch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    jq
    yq-go
    fzf

    # nix related
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal
    mailspring

    # system tools
    wl-clipboard

    # Editors
    helix
  ];

  # starship - an customizable prompt for any shell
  programs.starship = import ./config/starship.nix;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "Dracula";
    };

  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }

      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
    ];
  };

  programs.helix = import ./config/helix.nix;

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    theme = "Dracula";
    settings = {
      hide_window_decorations = true;
    };
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Dracula";
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = true;
    git = true;
  };

  programs.git = {
    enable = true;
    userName = "BIRSAx2";
    userEmail = "me@mouhieddine.dev";
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;

  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
