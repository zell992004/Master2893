{
  config,
  pkgs,
  lib,
  nixvim,
  ...
}: 
with lib;
  let
    cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim";};
  config = mkIf cfg.enable {
    programs.nixvim = {
        enable = true;
        extraPlugins = with pkgs.vimPlugins; [
          vim-nix
        ];
        colorschemes.gruvbox.enable = true;
        options = {
          number = true;
          relativenumber = true;
          shiftwidth = 2;
        };
    };
    
  };
}