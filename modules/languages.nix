{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [

    jdk22

  ];
}
