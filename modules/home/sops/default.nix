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
      age.keyFile = "../../../G14.asc";
      defaultSopsFile = ../../secrets.yaml;
      secrets."github/main/pass" = {};
      age.generateKey = true;
      defaultSymlinkPath = "/run/user/1000/secrets";
      defaultSecretsMountPoint = "/run/user/1000/secrets.d";
    };
  };
}
