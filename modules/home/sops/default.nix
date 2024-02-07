{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let 
  cfg = config.modules.sops-nix;
in {
  options.modules.sops-nix = { enable = mkEnableOption "sops-nix";};
  config = mkIf cfg.enable {
    sops = {
      age.keyfile = "/home/zell/.config/sops/age/keys.txt";
      defaultSopsFile = ../../../secrets.yaml;
      secrets.example-key = {};
      secrets."myservice/my_subdir/my_secret" = {};
    };
  };
}
