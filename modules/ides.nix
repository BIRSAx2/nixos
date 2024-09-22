{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    vscode
    jetbrains.datagrip
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.phpstorm
    jetbrains.rust-rover
    jetbrains.webstorm
    jetbrains.clion
    github-copilot-intellij-agent
  ];
}
