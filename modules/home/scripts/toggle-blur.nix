{ pkgs, lib, config, ... }:
with lib;
let
cfg = config.modules.toggle-blur;

in {
  options.modules.toggle-blur = {enable = mkEnableOption "toggle-blur";};
  config = mkIf cfg.enable {
    toggle-blur = pkgs.writeShellScriptBin "toggle-blur" ''
    blur_val=$(hyprctl getoption decoration:blur | grep int)
    echo "$blur_val"
    if [[ "$blur_val" == "	int: 1" ]]; then
        rm -rf ~/.local/bin/env/blur
        echo "hyprctl --batch 'keyword decoration:blur 0'" > ~/.local/bin/env/blur
        hyprctl --batch "keyword decoration:blur 0"
    else
        rm -rf ~/.local/bin/env/blur
        echo "hyprctl --batch 'keyword decoration:blur 1'" > ~/.local/bin/env/blur
        hyprctl --batch "keyword decoration:blur 1"
    fi
  '';
  };
}