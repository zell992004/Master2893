{ pkgs, config, inputs, lib, ... }:
  with lib;
    let
      cfg = config.modules.gaming;

 in{
  options.modules.gaming = { enable = mkEnableOption "gaming"; };
  config = mkIf cfg.enable {
  home.packages = with pkgs;[
    gamemode
    gamescope
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
  ];
  };
 }