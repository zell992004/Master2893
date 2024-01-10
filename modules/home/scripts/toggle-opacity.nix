{ pkgs, lib, config, ... }:
with lib;
let
cfg = config.modules.toggle-opacity;

in {
  options.modules.toggle-opacity = {enable = mkEnableOption "toggle-opacity";};
  config = mkIf cfg.enable {
      toggle-opacity = pkgs.writeShellScriptBin "toggle-opacity" ''
    opacity_val=$(hyprctl getoption decoration:active_opacity | grep float)
    echo "$opacity_val"
    if [[ "$opacity_val" == "	float: 0.850000" ]]; then
        rm -rf ~/.local/bin/env/opacity
        echo "hyprctl --batch 'keyword decoration:active_opacity 1.0 ; keyword decoration:inactive_opacity 1.0 ; keyword decoration:fullscreen_opacity 1.0'" > ~/.local/bin/env/opacity
        hyprctl --batch "keyword decoration:active_opacity 1.0 ; keyword decoration:inactive_opacity 1.0 ; keyword decoration:fullscreen_opacity 1.0"
    else
        rm -rf ~/.local/bin/env/opacity
        echo "hyprctl --batch 'keyword decoration:active_opacity 0.8500 ; keyword decoration:inactive_opacity 0.76 ; keyword decoration:fullscreen_opacity 1.0'" > ~/.local/bin/env/opacity
        hyprctl --batch "keyword decoration:active_opacity 0.8500 ; keyword decoration:inactive_opacity 0.76 ; keyword decoration:fullscreen_opacity 1.0"
    fi
  '';
  };
}