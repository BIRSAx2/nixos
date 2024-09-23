{ pkgs, pkgs-unstable, ... }:
{
  # Enable common container config files in /etc/containers
  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs-unstable; [
    tectonic
    obsidian
    anki
    pandoc
    typst
    texlive.combined.scheme-full
  ];
}
