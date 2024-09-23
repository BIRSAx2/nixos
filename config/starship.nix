{
  enable = true;
  settings = {
    add_newline = false;
    gcloud.disabled = true;
    line_break.disabled = true;

    # Add shell module configuration
    shell = {
      disabled = false;
      format = "$indicator";
      bash_indicator = "󱆃 ";
      fish_indicator = "󰈺 ";
      zsh_indicator = " ";
      powershell_indicator = " ";
      unknown_indicator = "󰼇 ";
    };

    battery = {
      full_symbol = "🔋";
      charging_symbol = "🔌";
      discharging_symbol = "⚡";

      display = [
        {
          threshold = 10;
          style = "bold red";
        }
        {
          threshold = 25;
          style = "bold orange";
        }
        {
          threshold = 50;
          style = "bold yellow";
        }
        {
          threshold = 100;
          style = "bold green";
        }
      ];
    };
    cmd_duration = {
      min_time = 10000; # Show command duration over 10,000 milliseconds (=10 sec)
      format = " took [$duration]($style)";
    };

    directory = {
      truncation_length = 5;
      format = "[$path]($style)[$lock_symbol]($lock_style) ";
      style = "bold #f57800";
      read_only = "🔒";
      read_only_style = "bold white";
    };

    git_branch = {
      format = " [$symbol$branch]($style) ";
      symbol = "🍣 ";
      style = "bold yellow";
    };

    git_commit = {
      commit_hash_length = 8;
      style = "bold white";
    };

    character = {
      error_symbol = "[ $shell](bold #ff0000)";
      success_symbol = "[ $shell](bold #ea00d9)";
    };
    # Ensure the shell module appears in your prompt
    format = "($battery)$all";

  };
}
