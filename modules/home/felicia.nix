{ inputs, config, lib, pkgs, ... }: {
  imports =
      [ (import ./waybar) ]
    ++ [ (import ./firefox) ]
    ++ [ (import ./codium) ]
    ++ [ (import ./hyprland) ]
    ++ [ (import ./git) ]
    ++ [ (import ./foot) ]
    ++ [ (import ./swaylock) ]
    ++ [ (import ./wofi) ]
    ++ [ (import ./zsh) ]
    ++ [ (import ./mako) ]
    ++ [ (import ./neofetch) ]
    ++ [ (import ./starship) ]
    ++ [ (import ./wlogout) ]
    ++ [ (import ./packagef) ]
    ++ [ (import ./tmux)]
    ++ [ (import ./gaming)]
    ++ [ (import ./gtk)]
    ++ [ (import ./scripts)]
    ;
    config.modules = {
        foot.enable = true;
        zsh.enable = true;
        neofetch.enable = true;
        starship.enable= true;
        packagef.enable = true;
        gaming.enable = true;
        tmux.enable = true;
        firefox.enable = true;
    };
}
