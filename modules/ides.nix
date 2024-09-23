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

    # Patch for Copilot on Jetbrains
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.datagrip [ "github-copilot" ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea-ultimate [ "github-copilot" ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.pycharm-professional [ "github-copilot" ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.rust-rover [ "github-copilot" ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.webstorm [ "github-copilot" ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.clion [ "github-copilot" ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.phpstorm [ "github-copilot" ])
  ];
}
