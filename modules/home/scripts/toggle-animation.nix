{ pkgs, lib, config, ... }:
with lib;
let
cfg = config.modules.toggle-animation;

in {
  options.modules.toggle-animation = {enable = mkEnableOption "toggle-animation";};
  config = mkIf cfg.enable {
     toggle-animation = pkgs.writeShellScriptBin "toggle-animation" ''
    blur_val=$(hyprctl getoption animations:enabled | grep int)
    echo "$blur_val"
    if [[ "$blur_val" == "	int: 1" ]]; then
        rm -rf ~/.local/bin/env/animation
        echo "hyprctl --batch 'keyword animations:enabled 0'" > ~/.local/bin/env/animation
        hyprctl --batch "keyword animations:enabled 0"
    else
        rm -rf ~/.local/bin/env/animation
        echo "hyprctl --batch 'keyword animations:enabled 1'" > ~/.local/bin/env/animation
        hyprctl --batch "keyword animations:enabled 1"
    fi
  '';
  };
}