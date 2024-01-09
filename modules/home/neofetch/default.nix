{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
cfg = config.modules.neofetch;
in {
  options.modules.neofetch = { enable = mkEnableOption "neofetch";};
  config = mkIf cfg.enable {
  home.packages = [pkgs.neofetch];
  };
}