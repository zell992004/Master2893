{pkgs, config, lib, ...}:
with lib;
let cfg = config.modules.barrier;
in {
  options.module.barrier = { enable = mkEnableOption "barrier";};
  config = mkIf cfg.enable {
    services.barrier.client = {
      enable = true;
      enableCrypto = false;
      enableDragDrop = true;
    };
  };
}