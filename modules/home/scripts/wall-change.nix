{pkgs, config, lib, ...}:
with lib;
let
cfg = config.modules.wall-change;
in{
  options.modules.wall-change = { enable = mkEnableOption "wall-change";};
  config = mkIf cfg.enable {
      wall-change = pkgs.writeShellScriptBin "wall-change" ''
    swww img $1 --transition-type random --transition-pos "$(hyprctl cursorpos)" --transition-duration 3
  '';
  load-env = pkgs.writeShellScriptBin "load-env" ''
    bash ~/.local/bin/env/animation
    bash ~/.local/bin/env/layout
    bash ~/.local/bin/env/opacity
    bash ~/.local/bin/env/blur
    bash ~/.local/bin/env/wallpaper
  '';
  };
}