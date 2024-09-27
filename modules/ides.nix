{ pkgs, pkgs-unstable, ... }:
let
  copilotLinkScript = pkgs.writeShellScript "copilot-link.sh" ''
    #!/usr/bin/env bash
    for ide in /home/*/.local/share/JetBrains/*; do
      basename=$(basename "$ide")
      if [[ $basename =~ .*[0-9]{4}\.[0-9]{1,2}$ ]]; then
        if [ -f "$ide/github-copilot-intellij/copilot-agent/native/linux-x64/copilot-language-server" ]; then
          echo "Linking GitHub Copilot agent for $ide"
          ln -fs /run/current-system/sw/bin/copilot-agent "$ide/github-copilot-intellij/copilot-agent/native/linux-x64/copilot-language-server"
        fi
      fi
    done
  '';
in
{
  environment.systemPackages = with pkgs-unstable; [
    vscode
    # jetbrains.datagrip
    # jetbrains.idea-ultimate
    # jetbrains.pycharm-professional
    # jetbrains.phpstorm
    # jetbrains.rust-rover
    # jetbrains.webstorm
    # jetbrains.clion

    # Patch for Copilot on Jetbrains
    github-copilot-intellij-agent
  ];
  # systemd.services.copilot-agent-link = {
  #   description = "Link GitHub Copilot agent for all JetBrains IDEs";
  #   after = [ "default.target" ];
  #   wantedBy = [ "default.target" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${copilotLinkScript}";
  #   };
  # };
}
