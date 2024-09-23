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
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    # shellAliases = {
    #   k = "kubectl";
    #   urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    #   urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    # };
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

  programs.helix = {
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
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Fira Code";
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
