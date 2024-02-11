{config, lib, pkgs, ...}:
with lib;
let
cfg = config.modules.tmux;
in {
options.modules.tmux = {enable = mkEnableOption "tmux";};
config = mkIf cfg.enable {
programs.tmux ={
  enable = true;
 # shell = "${pkgs.zsh}/bin/sh";
  terminal = "screen-256color";
  escapeTime = 10;
 };
};
}
