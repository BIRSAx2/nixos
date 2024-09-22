{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
  libgda6
 ];
}
