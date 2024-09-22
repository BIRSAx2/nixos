{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.username = "mouhieddine";
  home.homeDirectory = "/home/mouhieddine";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  # "Xcursor.size" = 16;
  # "Xft.dpi" = 172;
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    trash-cli
    grc
    nixfmt-rfc-style
    fastfetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    # eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # nix related
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    # btop  # replacement of htop/nmon
    # iotop # io monitoring
    # iftop # network monitoring

    # system call monitoring
    # strace # system call monitoring
    # ltrace # library call monitoring
    # lsof # list open files

    # system tools
    wl-clipboard
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    # pciutils # lspci
    # usbutils # lsusb

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

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  # programs.alacritty = {
  #   enable = true;
  #   # custom settings
  #   settings = {
  #     env.TERM = "xterm-256color";
  #     font = {
  #       size = 12;
  #       draw_bold_text_with_bright_colors = true;
  #     };
  #     scrolling.multiplier = 5;
  #     selection.save_to_clipboard = true;
  #   };
  # };

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
      # Manually packaging and enable a plugin

      # This is not working correctly, install it with fisher
      # {
      #   name = "fish-exa";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "gazorby";
      #     repo = "fish-exa";
      #     rev = "92e5bcb762f7c08cc4484a2a09d6c176814ef35d";
      #     sha = "sha256-VUOI/sCRuRGl6ZQMWA9v7JvBKMr5hR3ZAnQfDKQ5CfY=";
      #   };
      # }

      # {
      #   name = "z";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "jethrokuan";
      #     repo = "z";
      #     rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
      #     sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
      #   };
      # }
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
    config = {
      init = {
        defaultBranch = "main";
      };
    };
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
