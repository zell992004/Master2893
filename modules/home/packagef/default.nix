{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packagef;
    in {
      
    options.modules.packagef = { enable = mkEnableOption "packagef"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # programming
      nix-prefetch-github
      rnix-lsp
      # others
      openssl
      libnotify
      pamixer
      xfce.thunar
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      bleachbit
      imv
      htop
      nvtop
      xdg-utils
      fzf
      ffmpeg
      bore-cli
      discord
      eza
      zsh-prezto
    ];
    };
}
