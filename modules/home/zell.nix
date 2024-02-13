{ inputs, config, lib, pkgs, ... }: {
  imports =
#       [ inputs.sops-nix.homeManagerModules.sops ]
       [ inputs.nixvim.homeManagerModules.nixvim ]
    ++ [ (import ./waybar) ]
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
    ++ [ (import ./packagep) ]
    ++ [ (import ./tmux)]
    ++ [ (import ./gaming)]
    ++ [ (import ./gtk)]
    ++ [ (import ./scripts)]
   # ++ [ (import ./nixvim)]
    ++ [ (import ./lazyvim)]
   # ++ [ (import ./sops)]
    ;
    config.modules = {
   #     sops-nix.enable = true;
   #     nixvim.enable = true;
        lazyvim.enable = true;
        tmux.enable = true;
        waybar.enable = true;
        waybarsetting.enable = true;
        waybarstyle.enable = true;
        codium.enable = true;
        hyprland.enable = true;
        hyprconfig.enable = true;
        hyprvar.enable = true;
        git.enable = true;
        foot.enable = true;
        swaylock.enable = true;
        wofi.enable = true;
        zsh.enable = true;
        mako.enable = true;
        neofetch.enable = true;
        starship.enable= true;
        wlogout.enable = true;
        packagep.enable = true;
        gaming.enable = true;
        gtk.enable = true;
        firefox.enable = true;
        scripts.enable = true;
    };
}
